import QtQuick 2.11
import QtQuick.Controls 2.15

Rectangle {
    id: bkgnd;
    implicitWidth: 190;
    implicitHeight: 50;

    //color: "transparent";
    color: Qt.rgba(46/255, 46/255, 56/255, 1);

    property alias iconSource: icon.source;
    property alias iconWidth: icon.width;
    property alias iconHeight: icon.height;
    property alias bnHeight: bkgnd.implicitHeight;
    property alias bnWidth: bkgnd.implicitWidth;
    property var hoveredMsg: "undefined";

    radius: 6;
    property bool hovered: false;
    border.color: "#949494";
    border.width: hovered ? 2 : 0;
    signal clicked;
    signal entered;

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
//            bkgnd.entered(true);
        }

        onExited: {
            bkgnd.hovered = false;
//            bkgnd.entered(false);
        }

        onClicked: {
            bkgnd.hovered = false;
            bkgnd.clicked();
        }

        ToolTip {
            delay: 50;
            visible: bkgnd.hovered;

            contentItem: Text{
                color: "#ffffff";
                text: bkgnd.hoveredMsg;
            }

            background: Rectangle{
                color: Qt.rgba(64/255, 64/255, 78/255, 1)
                radius: 4
            }
        }
    }
}
