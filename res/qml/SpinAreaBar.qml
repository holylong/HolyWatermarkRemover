import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    height: 30;
    color: Qt.rgba(36/255, 36/255, 40/255, 1);
    radius: 5;

    Rectangle {
        width: parent.width - btnOperate.width - 10;
        height: parent.height;
        color: Qt.rgba(36/255, 36/255, 40/255, 1);


        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            color: Qt.rgba(36/255, 36/255, 40/255, 1);
            width: 480;
            height: 20;
            Label {
                anchors.left: parent.left;
                id: spinTitleKey;
                text: qsTr("id_area_title");
                color: Qt.rgba(1,1,1,1);
                font.pixelSize: 13;
                horizontalAlignment: Text.horizontalCenter;
            }
            Label {
                id: spinTitleValue;
                anchors.left: spinTitleKey.right;
                text: "1";
                color: Qt.rgba(1,1,1,1);
                font.pixelSize: 13;
                horizontalAlignment: Text.horizontalCenter;
            }

            Rectangle {
                id: spinStart;
                color: Qt.rgba(1,1,1,1);
                anchors.left: spinTitleValue.right;
                anchors.leftMargin: 20;
                width: 200;
                Row {
                    spacing: 2;
                    anchors.fill: parent;
                    anchors.verticalCenter: parent.verticalCenter;
                    Label {
                        text: qsTr("id_start");
                        width: 40;
                        color: Qt.rgba(1,1,1,1);
                        font.pixelSize: 13;
                        horizontalAlignment: Text.horizontalCenter;
                    }

                    SpinBox {
                        width: 50;
                        from: 0;
                        value: 50;
                        to: 100;
                        stepSize: 1;
                        background: Rectangle {
                            color: Qt.rgba(64/255, 64/255, 78/255, 1);
                            anchors.fill: parent;
                        }
                    }
                    SpinBox {
                        width: 50;
                    }
                    SpinBox {
                        width: 50;
                    }
                }
            }

            Rectangle {
                color: Qt.rgba(1,1,1,1);
                id: spinEnd;
                anchors.left: spinStart.right;
                anchors.leftMargin: 20;
                width: 200;
                Row {
                    spacing: 2;
                    anchors.fill: parent;
                    anchors.verticalCenter: parent.verticalCenter;
                    Label {
                        text: qsTr("id_end");
                        width: 40;
                        color: Qt.rgba(1,1,1,1);
                        font.pixelSize: 13;
                        horizontalAlignment: Text.horizontalCenter;
                    }

                    SpinBox {
                        width: 50;
                    }
                    SpinBox {
                        width: 50;
                    }
                    SpinBox {
                        width: 50;
                    }
                }
            }
        }

    }

    Rectangle {
        width: 25;
        height: 25;
        color: Qt.rgba(21/255, 21/255, 27/255, 1);
        anchors.verticalCenter: parent.verticalCenter;
        anchors.right: parent.right;
        anchors.rightMargin: 20;
        radius: 5;
        IconButton {
            anchors.centerIn: parent;
            id: btnOperate
            iconSource: "../icons/operate.svg";
            width: 20;
            height: 20;
            hoveredMsg: qsTr("id_operate_msg");
        }
    }
}
