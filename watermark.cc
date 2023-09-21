#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/video.hpp>
#include <opencv2/highgui.hpp>
#include <vector>
#include <string>
#include <filesystem>
#include <fstream>

namespace fs = std::filesystem;

const std::string VIDEO_PATH = "video";
const std::string OUTPUT_PATH = "output";
const std::string TEMP_VIDEO = "temp.mp4";

class WatermarkRemover {
public:
    WatermarkRemover(int threshold, int kernel_size) : threshold(threshold), kernel_size(kernel_size) {};
    void remove_video_watermark();
    void remove_video_subtitle();

private:
    int threshold;
    int kernel_size;
    std::vector<int> select_roi(cv::Mat img, std::string hint);
    cv::Mat dilate_mask(cv::Mat mask);
    cv::Mat generate_single_mask(cv::Mat img, std::vector<int> roi, int threshold);
    cv::Mat generate_watermark_mask(std::string video_path);
    cv::Mat generate_subtitle_mask(cv::Mat frame, std::vector<int> roi);
    cv::Mat inpaint_image(cv::Mat img, cv::Mat mask);
    void merge_audio(std::string input_path, std::string output_path, std::string temp_path);
};

std::vector<int> WatermarkRemover::select_roi(cv::Mat img, std::string hint) {
    const float COFF = 0.7;
    int w = static_cast<int>(COFF * img.cols);
    int h = static_cast<int>(COFF * img.rows);
    cv::Mat resize_img;
    cv::resize(img, resize_img, cv::Size(w, h));
    cv::Rect roi = cv::selectROI(hint, resize_img, false, false);
    cv::destroyAllWindows();
    std::vector<int> watermark_roi{ static_cast<int>(roi.x / COFF), static_cast<int>(roi.y / COFF),
                                     static_cast<int>(roi.width / COFF), static_cast<int>(roi.height / COFF) };
    return watermark_roi;
}

cv::Mat WatermarkRemover::dilate_mask(cv::Mat mask) {
    cv::Mat kernel = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(kernel_size, kernel_size));
    cv::dilate(mask, mask, kernel);
    return mask;
}

cv::Mat WatermarkRemover::generate_single_mask(cv::Mat img, std::vector<int> roi, int threshold) {
    if (roi.size() != 4) {
        std::cerr << "NULL ROI!" << std::endl;
        exit(-1);
    }
    cv::Mat roi_img = cv::Mat::zeros(img.rows, img.cols, CV_8UC1);
    int start_x = roi[1], end_x = roi[1] + roi[3];
    int start_y = roi[0], end_y = roi[0] + roi[2];
    cv::Mat gray;
    cv::cvtColor(img, gray, cv::COLOR_BGR2GRAY);
    gray(cv::Rect(start_y, start_x, end_y - start_y, end_x - start_x)).copyTo(roi_img(cv::Rect(start_y, start_x, end_y - start_y, end_x - start_x)));
    cv::Mat mask;
    cv::threshold(roi_img, mask, threshold, 255, cv::THRESH_BINARY);
    return mask;
}

cv::Mat WatermarkRemover::generate_watermark_mask(std::string video_path) {
    cv::VideoCapture video(video_path);
    cv::Mat frame;
    video.read(frame);
    std::vector<int> roi = select_roi(frame, "select watermark ROI");
    cv::Mat mask = cv::Mat::ones(frame.rows, frame.cols, CV_8UC1) * 255;

    int step = static_cast<int>(video.get(cv::CAP_PROP_FRAME_COUNT)) / 5;
    int index = 0;
    while (video.read(frame)) {
        if (index % step == 0) {
            mask = mask & generate_single_mask(frame, roi, threshold);
        }
        index++;
    }

    return dilate_mask(mask);
}

cv::Mat WatermarkRemover::generate_subtitle_mask(cv::Mat frame, std::vector<int> roi) {
    cv::Mat mask = generate_single_mask(frame, { 0, roi[1], frame.cols, roi[3] }, threshold);
    return dilate_mask(mask);
}

cv::Mat WatermarkRemover::inpaint_image(cv::Mat img, cv::Mat mask) {
    cv::Mat telea;
    cv::inpaint(img, mask, telea, 1, cv::INPAINT_TELEA);
    return telea;
}

void WatermarkRemover::merge_audio(std::string input_path, std::string output_path, std::string temp_path) {
#if 0
    cv::VideoCapture video(input_path);
    double fps = video.get(cv::CAP_PROP_FPS);
    cv::Size size(static_cast<int>(video.get(cv::CAP_PROP_FRAME_WIDTH)), static_cast<int>(video.get(cv::CAP_PROP_FRAME_HEIGHT)));
    cv::VideoWriter writer(temp_path, cv::VideoWriter::fourcc('m', 'p', '4', 'v'), fps, size);

    cv::Mat frame;
    while (video.read(frame)) {
        writer.write(frame);
    }
    writer.release();
    video.release();
#endif
    //"ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 output.mp4"
    // 第一个视频的音频0:a:0， 第一个视频的音频的第一条音轨，第二个视频的视频1:v:0， 第二个视频的视频的第一条视轨
    std::string command = "ffmpeg -i " + input_path + " -i " + temp_path + " -c copy -map 0:a:0 -map 1:v:0 " + output_path;
    std::system(command.c_str());

    fs::remove(temp_path);
}

void WatermarkRemover::remove_video_watermark() {
    if (!fs::exists(OUTPUT_PATH)) {
        fs::create_directory(OUTPUT_PATH);
    }

    std::vector<std::string> filenames;
    for (auto& entry : fs::directory_iterator(VIDEO_PATH)) {
        filenames.push_back(entry.path().string());
    }
    cv::Mat mask;
    for (size_t i = 0; i < filenames.size(); i++) {
        cv::Mat frame;
        cv::VideoCapture video(filenames[i]);
        video.read(frame);
        if (i == 0) {
            mask = generate_watermark_mask(filenames[i]);
        }
        double fps = video.get(cv::CAP_PROP_FPS);
        cv::Size size(static_cast<int>(video.get(cv::CAP_PROP_FRAME_WIDTH)), static_cast<int>(video.get(cv::CAP_PROP_FRAME_HEIGHT)));
        cv::VideoWriter writer(TEMP_VIDEO, cv::VideoWriter::fourcc('m', 'p', '4', 'v'), fps, size);

        while (video.read(frame)) {
            frame = inpaint_image(frame, mask);
            cv::imshow("inpaint", frame);
            cv::waitKey(3);
            writer.write(frame);
        }

        video.release();
        writer.release();

        std::string output_path = OUTPUT_PATH + "/" + fs::path(filenames[i]).stem().string() + "_no_watermark.mp4";
        merge_audio(filenames[i], output_path, TEMP_VIDEO);
    }

    if (fs::exists(TEMP_VIDEO)) {
        fs::remove(TEMP_VIDEO);
    }
}

void WatermarkRemover::remove_video_subtitle() {
    if (!fs::exists(OUTPUT_PATH)) {
        fs::create_directory(OUTPUT_PATH);
    }

    std::vector<std::string> filenames;
    for (auto& entry : fs::directory_iterator(VIDEO_PATH)) {
        filenames.push_back(entry.path().string());
    }
    std::vector<int> roi;
    for (size_t i = 0; i < filenames.size(); i++) {
        cv::Mat frame;
        cv::VideoCapture video(filenames[i]);
        video.read(frame);
        if (i == 0) {
            roi = select_roi(frame, "select subtitle ROI");
        }
        double fps = video.get(cv::CAP_PROP_FPS);
        cv::Size size(static_cast<int>(video.get(cv::CAP_PROP_FRAME_WIDTH)), static_cast<int>(video.get(cv::CAP_PROP_FRAME_HEIGHT)));
        cv::VideoWriter writer(TEMP_VIDEO, cv::VideoWriter::fourcc('m', 'p', '4', 'v'), fps, size);

        while (video.read(frame)) {
            cv::Mat mask = generate_subtitle_mask(frame, roi);
            frame = inpaint_image(frame, mask);
            writer.write(frame);
        }

        video.release();
        writer.release();

        std::string output_path = OUTPUT_PATH + "/" + fs::path(filenames[i]).stem().string() + "_no_sub.mp4";
        merge_audio(filenames[i], output_path, TEMP_VIDEO);
    }

    if (fs::exists(TEMP_VIDEO)) {
        fs::remove(TEMP_VIDEO);
    }
}

int main() {
    WatermarkRemover remover(80, 5);
    remover.remove_video_watermark();

#if 0
    remover = WatermarkRemover(80, 10);
    remover.remove_video_subtitle();
#endif 
    return 0;
}