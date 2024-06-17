#ifndef VIDEOEDITOR_H
#define VIDEOEDITOR_H

#include <QObject>
#include <QQueue>
#include <QImage>
#include <QVariantList>
#include <opencv2/opencv.hpp>

#include "qimagelistmodel.h"

class VideoEditor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString videoPath READ videoPath WRITE setVideoPath NOTIFY videoPathChanged)
//    Q_PROPERTY(QVariantList keyFrames READ keyFrames NOTIFY keyFramesChanged)
    Q_PROPERTY(QImageListModel* model READ getModel CONSTANT)
    Q_PROPERTY(int currentEditedFrame READ currentEditedFrame NOTIFY currentEditedFrameChanged)

public:
    explicit VideoEditor(QObject *parent = nullptr);

    Q_INVOKABLE QString videoPath() const;
    Q_INVOKABLE void setVideoPath(const QString &newPath);

    // 获取关键帧列表（这里简化为QVariantList，实际应用可能需要更复杂的模型）
//    QVariantList keyFrames() const { return m_keyFrames; }

    // 当前编辑帧
    int currentEditedFrame() const { return m_currentEditedFrame; }

    QImageListModel* getModel() const {
        return model;
    }

    Q_INVOKABLE void addImage(const QImage &image) {
        model->addImage(image);
    }

signals:
    void videoPathChanged(const QString &newPath);
    void keyFramesChanged();
    void currentEditedFrameChanged();

private slots:
    void processVideo();

private:
    QString m_videoPath;
    QQueue<QImage> m_keyFrames;
    int m_currentEditedFrame = -1;
    QImageListModel *model;
};

#endif // VIDEOEDITOR_H
