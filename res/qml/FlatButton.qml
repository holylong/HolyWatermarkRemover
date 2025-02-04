import QtQuick 2.11

Rectangle {
    id: bkgnd;
    implicitWidth: 190;
    implicitHeight: 50;

    color: "transparent";

    property alias iconSource: icon.source;
    property alias iconWidth: icon.width;
    property alias iconHeight: icon.height;
    property alias textColor: btnText.color;
    property alias text: btnText.text;
    property alias font: btnText.font;

    radius: 6;
    property bool hovered: false;
    border.color: "#949494";
    border.width: hovered ? 2 : 0;
    signal clicked;

    Image {
        id: icon;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
        width: 40;
        height: 40;
    }

    Text {
        id: btnText;
        anchors.left: icon.right;
        anchors.verticalCenter: icon.verticalCenter;
        anchors.margins: 4;
        color: ma.pressed ? "blue" : (parent.hovered ? "#0000a0" : "white");
    }

    MouseArea {
        id: ma;
        anchors.fill: parent;
        hoverEnabled: true;
        onEntered: {
            bkgnd.hovered = true;
        }

        onExited: {
            bkgnd.hovered = false;
        }

        onClicked: {
            bkgnd.hovered = false;
            bkgnd.clicked();
        }
    }
}
