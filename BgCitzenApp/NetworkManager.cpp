#include "NetworkManager.h"

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonObject>


NetworkManager::NetworkManager(QObject *parent) : QObject(parent)
{
}

void NetworkManager::sendCheckRequest(const QString &postData)
{
    // Setup the webservice url
    auto serviceUrl = QUrl("http://publicbg.mjs.bg/BgInfo/ReqInfo/GetReqInfo");

    // Call the webservice
    auto networkManager = new QNetworkAccessManager(this);
    connect(networkManager, &QNetworkAccessManager::finished, this, &NetworkManager::onPostAnswer);
    connect(networkManager, &QNetworkAccessManager::finished, this, &QNetworkAccessManager::deleteLater);

    QNetworkRequest networkRequest(serviceUrl);
    networkRequest.setHeader(QNetworkRequest::ContentTypeHeader,"application/json;charset=UTF-8");

    networkManager->post(networkRequest, postData.toLatin1());   
}

void NetworkManager::onPostAnswer(QNetworkReply *networkReply)
{
    auto data = QString::fromUtf8(networkReply->readAll());
    emit checkResult(data);
}

