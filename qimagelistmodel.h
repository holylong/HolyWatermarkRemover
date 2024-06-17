#ifndef QIMAGELISTMODEL_H
#define QIMAGELISTMODEL_H

#include <QAbstractListModel>
#include <QImage>
#include <QVector>

class QImageListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)
public:
    enum ImageRoles {
        ImageRole = Qt::UserRole + 1
    };

    QImageListModel(QObject *parent = nullptr);
    QVariant getImageDataAsBase64(const QModelIndex &index) const;
    void addImage(const QImage &image);
    Q_INVOKABLE int count(){return m_count;}
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<QImage> m_images;
    int             m_count;

signals:
    void countChanged();
};

#endif // QIMAGELISTMODEL_H
