import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    property alias resultTextController: resultText
    property alias waitCursorController: waitResult


    Image {
        id: headerImage
        source: "qrc:/res/header.png"
        anchors.top: parent.top
        width: parent.width
        fillMode: Image.PreserveAspectFit
    }

    ButtonGroup { id: personGroup }
    RadioButton{
        ButtonGroup.group:  personGroup
        anchors.top: headerImage.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.02
        anchors.leftMargin: parent.width*0.25
        text: ""

        onCheckedChanged: {
            if(checked){
                nomerInput.text = "16303/2016";
                pinInput.text = "378501";
            }
        }
    }

    RadioButton{
        ButtonGroup.group: personGroup
        anchors.top: headerImage.bottom
        anchors.right: parent.right
        anchors.topMargin: parent.height*0.02
        anchors.rightMargin: parent.width*0.25
        text: ""

        onCheckedChanged: {
            if(checked){
                nomerInput.text = "16304/2016";
                pinInput.text = "397592";
            }
        }
    }

    Text {
        id: nomerLabel
        anchors.top: headerImage.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.1
        anchors.leftMargin: parent.width*0.05
        text: qsTr("Молба вх.номер")
    }

    TextField{
        id: nomerInput
        anchors.top: nomerLabel.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.01
        anchors.leftMargin: parent.width*0.05
        font.pixelSize: parent.height*0.04
        width: parent.width*0.9
        height: parent.height*0.06

    }

    Text {
        id: pinLabel
        anchors.top: nomerInput.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.02
        anchors.leftMargin: parent.width*0.05
        text: qsTr("ПИН")
    }

    TextField{
        id: pinInput
        anchors.top: pinLabel.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.01
        anchors.leftMargin: parent.width*0.05
        font.pixelSize: parent.height*0.04
        width: parent.width*0.9
        height: parent.height*0.06
    }

    Rectangle{
        id: checkButton
        anchors.top: pinInput.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.05
        anchors.leftMargin: parent.width*0.05
        width: parent.width*0.9
        height: parent.height*0.08
        radius: 3
        color: "green"

        Text {
            id: buttonText
            text: qsTr("Провери")
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: parent.height*0.4

        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {

                if(nomerInput.text.length == 0 ||
                        pinInput.text.length == 0){
                    return;
                }

                waitResult.visible = true;
                var custdata = {
                    reqnum: nomerInput.text,
                    pin: pinInput.text
                }
                var data = JSON.stringify(custdata);

                console.log(data);
                networkManager.sendCheckRequest(data);

            }
        }

    }

    AnimatedImage {
        id: waitResult;
        source: "qrc:/res/loading.gif"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: checkButton.bottom
        anchors.topMargin: parent.height*0.01
        visible: false
    }

    Rectangle{
        id: result
        anchors.top: checkButton.bottom
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.05
        anchors.leftMargin: parent.width*0.05
        border.width: 1
        border.color: "white"
        width: parent.width*0.9
        height: parent.height*0.25
        radius: 3
        color: "lightgreen"
    }
    Text {
        id: resultText
        text: qsTr("")
        anchors.fill: result
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: parent.height*0.03
        wrapMode: Text.WordWrap

    }

    Image {
        id: bgGrbImage
        source: "qrc:/res/bggrb.png"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: parent.height*0.01
        height: parent.height*0.15
        fillMode: Image.PreserveAspectFit
    }



}
