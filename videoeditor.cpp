#include "videoeditor.h"
#include <QDebug>
#include <QtConcurrent>
#include <opencv2/opencv.hpp>

VideoEditor::VideoEditor(QObject *parent) : QObject(parent), m_videoPath(""),model(new QImageListModel(this))
{

}


QString VideoEditor::videoPath() const{
    return m_videoPath;
}
void VideoEditor::setVideoPath(const QString &newPath){
    if(newPath != m_videoPath){
        m_videoPath = newPath;
        qDebug() << "video path:" << newPath;
        emit videoPathChanged(newPath);

        QtConcurrent::run([=]() {
            int step = 0;
            qDebug() << "want to read video";
            cv::VideoCapture vc;
            vc.open(newPath.toStdString().c_str());
            if(vc.isOpened()){
                cv::Mat frame;
                vc >> frame;
                qDebug() << "open video ok";
                while(!frame.empty()){
//                    qDebug() << "read frame ok";
                    if(step++%240 == 0)
                    model->addImage(QImage(frame.data, frame.cols, frame.rows, frame.step, QImage::Format_RGB888));
//                    qDebug() << "insert frame ok";

                    vc >> frame;
                }

                vc.release();
            }else{
                qDebug() << "open video failed";
            }

            qDebug() << "read video end";
        });
    }
}


void VideoEditor::processVideo()
{
    cv::VideoCapture cap(m_videoPath.toStdString());
    if (!cap.isOpened()) {
        qWarning() << "Error opening video file";
        return;
    }

    // 假设每秒一帧作为关键帧，实际应用可能需要更复杂的逻辑来确定关键帧
    cv::Mat frame;
    while (cap.read(frame)) {
        QImage image(frame.data, frame.cols, frame.rows, frame.step, QImage::Format_RGB888);
        // 考虑到OpenCV的颜色通道顺序与QImage不同，这里可能需要调整
        image = image.rgbSwapped();
        m_keyFrames.enqueue(image);

        // 这里可以加入更智能的关键帧选择逻辑
    }

    cap.release();
    emit keyFramesChanged();
}
