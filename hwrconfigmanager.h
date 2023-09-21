#ifndef HWRCONFIGMANAGER_H
#define HWRCONFIGMANAGER_H

#include <QObject>
#include <QFile>
#include <QDir>
#include <QDebug>

class HwrConfigManager : public QObject
{
    Q_OBJECT
public:
    explicit HwrConfigManager(QObject *parent = nullptr);


    static HwrConfigManager* Instance(){
        static HwrConfigManager instance;
        return &instance;
    }

    void LoadConfig(){
        QFile file("hwr_config.json");
    }

signals:

};

#endif // HWRCONFIGMANAGER_H
