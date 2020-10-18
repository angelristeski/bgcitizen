#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QNetworkReply>

class NetworkManager : public QObject
{
    Q_OBJECT
public:
    explicit NetworkManager(QObject *parent = nullptr);

    Q_INVOKABLE void sendCheckRequest(const QString &postData);

signals:
    void checkResult(QString result);

private slots:
    void onPostAnswer(QNetworkReply* networkReply);
};

#endif // NETWORKMANAGER_H
