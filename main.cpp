#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QTranslator>
#include <QQmlContext>
#include "videoeditor.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "HolyWatermarkRemover_" + QLocale(locale).name();
        if (translator.load(":/res/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    app.setWindowIcon(QIcon(u":/res/icons/holy.svg"_qs));


    QQmlApplicationEngine engine;
//    const QUrl url(u"qrc:/HolyWatermarkRemover/res/qml/MainView.qml"_qs);
//    const QUrl url(QStringLiteral("qrc:/res/qml/Main.qml"));

    VideoEditor videoEditor;
    engine.rootContext()->setContextProperty("videoEditor", &videoEditor);

    const QUrl url(u"qrc:/HolyWatermarkRemover/res/qml/WatermarkScene.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
