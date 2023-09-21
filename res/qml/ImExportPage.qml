import QtQuick 2.11
import QtQuick.Controls 2.15

Rectangle {
    width: 255;

    color: Qt.rgba(32/255, 32/255, 40/255, 1)
    radius: 10;

    FlatButton {
        anchors.top: parent.top;
        anchors.topMargin: 20;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        iconSource: "../icons/question.svg"
        iconHeight: 20;
        iconWidth: 20;
        width: 80;
        height: 20;
        text: qsTr("移除模式");
        id: titleRemover;
    }

    ComboBox {
        anchors.top: titleRemover.bottom;
        anchors.topMargin: 10;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        width: parent.width-20;
        background: Rectangle{
            color: Qt.rgba(64/255,64/255,78/255,1);
        }
        model: ListModel {
            id: model
            ListElement { text: "Banana" }
            ListElement { text: "Apple" }
            ListElement { text: "Coconut" }
        }
    }
}
