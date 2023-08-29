import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: bkgnd;
    implicitHeight: 100;
    implicitWidth: 100;
    color: "transparent"

    signal clicked();

    property alias iconSource: icon.source;
    property bool hovered: false;
    property var hoveredMsg: "undefined";

    MouseArea {
        anchors.fill: parent;
        hoverEnabled: true;
        onEntered: {
            bkgnd.hovered = true;
            console.log('icon button is hovered');
        }
        onExited: {
            bkgnd.hovered = false;
        }

        onClicked: {
            bkgnd.hovered = false;
            bkgnd.clicked();
        }
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

    Image {
        id: icon;
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
    }
}
