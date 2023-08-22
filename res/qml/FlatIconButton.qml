import QtQuick 2.11

Rectangle {
    id: bkgnd;
    implicitWidth: 190;
    implicitHeight: 50;

    color: "transparent";

    property alias iconSource: icon.source;
    property alias iconWidth: icon.width;
    property alias iconHeight: icon.height;
    property alias bnHeight: bkgnd.implicitHeight;
    property alias bnWidth: bkgnd.implicitWidth;

    radius: 6;
    property bool hovered: false;
    border.color: "#949494";
    border.width: hovered ? 2 : 0;
    signal clicked;

    Image {
        id: icon;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: 40;
        height: 40;
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
