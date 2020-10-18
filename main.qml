import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: rootWindow
    visible: true
    width: 720/2
    height: 1280/2
    title: qsTr("BgCitzen")

    Connections{
        target: networkManager

        onCheckResult:{
            var resultJSON = JSON.parse(result);

            mainWindow.waitCursorController.visible = false;

            if(resultJSON.success)
            {
                mainWindow.resultTextController.text = resultJSON.resultstr;
            }
            else
            {
                mainWindow.resultTextController.text = "Грешка!";
            }

        }
    }

    MainWindow{
        id: mainWindow
        anchors.fill: parent
    }
}
