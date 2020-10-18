#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTextCodec>
#include "NetworkManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QTextCodec *utfcodec = QTextCodec::codecForName("UTF-8");
    QTextCodec::setCodecForLocale(utfcodec);

    QQmlApplicationEngine engine;
    NetworkManager networkManager;
    engine.rootContext()->setContextProperty("networkManager",&networkManager);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
