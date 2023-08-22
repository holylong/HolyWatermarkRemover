#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(u":/res/icons/holy.svg"_qs));
    QQmlApplicationEngine engine;
//    const QUrl url(u"qrc:/HolyWatermarkRemover/res/qml/MainView.qml"_qs);
//    const QUrl url(QStringLiteral("qrc:/res/qml/Main.qml"));
    const QUrl url(u"qrc:/HolyWatermarkRemover/res/qml/WatermarkScene.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
