import QtQuick 2.11
import QtQuick.Controls 2.15

Rectangle {
    implicitWidth: 255;
    implicitHeight: 500;
    radius: 10;
    color: Qt.rgba(32/255, 32/255, 40/255, 1)
    id: idAreaSelect;
    visible: true;

    property list<string> areas: ["label1", "label2", "label3"]

    Rectangle {
        id: areaTitle;
        height: 50;
        width: parent.width;
        anchors.top: parent.top;
        anchors.topMargin: 0;
        color: Qt.rgba(32/255, 32/255, 40/255, 1);
        z:2;

        Label {
            id: labelArea;
            text: qsTr("selectArea");
            visible: true;
            width: 40;
            height: 40;
            font.pixelSize: 15;
            color: Qt.rgba(1,1,1,1);
            anchors.left: parent.left;
            anchors.leftMargin: 5;
            anchors.top: parent.top;
            anchors.topMargin: 30;
            z:2;
        }

        IconButton {
            id: addIcon;
            iconSource: "../icons/addition.svg";
            hoveredMsg: qsTr("New_Area");
            width: 30;
            height: 30;
            anchors.right: parent.right;
            anchors.rightMargin: 5;
            anchors.top: parent.top;
            anchors.topMargin: 20;
            onClicked: {
                areas.push("area");
            }
            z:2;
        }
    }

    Component {
        id: areaSelectDelegate;

        Rectangle {
            id: wrapperRect;
            radius: 10;
            visible: true;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: idAreaSelect.width - 20;
            height: 60;

            color: Qt.rgba(46/255, 46/255, 56/255, 1);

            MouseArea {
                anchors.fill: parent;
                onClicked: wrapperRect.ListView.view.currentIndex = index;
            }

            Row {
                spacing: 10;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 6;
                Column {
                    width: wrapperRect.width - 45;
                    spacing: 5;
                    Text {
                        text: '<b>Area:</b> ' + modelData;
                        color: "white"
                    }
                    Text {
                        text: '000:00:000' + ' - ' + '000:00:000';
                        color: "white"
                    }
                }

                IconButton {
                    width: 20;
                    height: 20;
                    iconSource: "../icons/deleteall.svg"
                    hoveredMsg: qsTr("delete_area");
                }
            }
        }
    }

    ListView {
        width: parent.width;
        height: parent.height - areaTitle.height;
        anchors.top: areaTitle.bottom;
        anchors.topMargin: 10;
        model: areas;

        spacing: 5;

        delegate: areaSelectDelegate;
        highlight: Rectangle {
            color: "transparent"
            z:2;
            radius: 10;
            border.color: "gray"
            border.width: 3;
            anchors.horizontalCenter: parent.horizontalCenter;
        }

        focus: true;
    }
}
