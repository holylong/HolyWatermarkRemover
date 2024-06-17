import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: bkgnd;
    implicitHeight: 100;
    implicitWidth: 100;
    color: hovered ? Qt.rgba(64/255, 64/255, 78/255, 1) : Qt.rgba(46/255,46/255,56/255,1)

    signal clicked();

    property alias iconSource: icon.source;
    property bool hovered: false;
    property string hoveredMsg: "undefined";
    property real iconWidth: icon.width;
    property real iconHeight: icon.height;

    border.color: "#949494";
    border.width: hovered ? 2 : 0;
    radius: 10;

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
            color: Qt.rgba(46/255, 46/255, 56/255, 1)
            radius: 4
        }
    }

    Image {
        id: icon;
        width: parent.iconWidth;
        height: parent.iconHeight;
        fillMode: Image.PreserveAspectFit;
        anchors.centerIn: parent;
    }
}
