#include "qimagelistmodel.h"
#include <QBuffer>
#include <QIODevice>


QImageListModel::QImageListModel(QObject *parent)
    : QAbstractListModel(parent),m_count(0)
{
}

void QImageListModel::addImage(const QImage &image)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_images.append(image);


//    m_count++;
    m_count = m_images.count();
    endInsertRows();

    emit countChanged();
}

// 在ExampleModel类中添加此方法
QVariant QImageListModel::getImageDataAsBase64(const QModelIndex &index) const
{
    if (!index.isValid() || index.row() >= m_images.size())
        return QVariant();

    QImage img = m_images[index.row()];
    QByteArray ba;
    QBuffer buffer(&ba);
    buffer.open(QIODevice::WriteOnly);
    img.save(&buffer, "PNG"); // 或选择其他格式，如"JPEG"
    buffer.close();

    return QString("data:image/png;base64,").append(ba.toBase64().constData()); // 根据保存的格式调整"data:image/"
}

int QImageListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_images.count();
}

QVariant QImageListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_images.size())
        return QVariant();

    if (role == ImageRole)
//        return m_images[index.row()];
        return getImageDataAsBase64(index);

    return QVariant();
}

QHash<int, QByteArray> QImageListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ImageRole] = "imageData";
    return roles;
}
