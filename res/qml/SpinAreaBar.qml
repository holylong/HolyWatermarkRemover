import QtQuick 2.0
import QtQuick.Controls 2.15

import QtQuick.Controls.Material 2.15

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
                        height: 20;
                        from: 0;
                        value: 50;
                        to: 100;
                        stepSize: 1;

                        background: Rectangle {
                            color: Qt.rgba(64/255, 64/255, 78/255, 1);
                            radius: 1
                        }

                        contentItem: Text {
                            id: text1
                            font.pixelSize: 20;
                            opacity: enabled ? 1.0 : 0.3
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                    }
                    SpinBox {
                          width: 50
                          height: 20
                          value: 50
                          stepSize: 1
                          editable: true

                          background: Rectangle {
                              color: Qt.rgba(64/255, 64/255, 78/255, 1);
                              radius: 1
                          }

                          contentItem: Text {
                              color: "white"
                          }
                    }
                    SpinBox {
                        width: 50;
                        height: 20;

                        background: Rectangle {
                            color: Qt.rgba(64/255, 64/255, 78/255, 1);
                            radius: 1
                        }
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
                        height: 20;
                        // 设置字体
                        font.pixelSize: 16 // 设置字体大小

                        // 设置文本水平和垂直居中对齐
                        contentItem: Text {
                            text: control.text
                            font: control.font
                            color: control.textColor
                            verticalAlignment: Text.AlignVCenter // 垂直居中对齐
                            horizontalAlignment: Text.AlignHCenter // 水平居中对齐
                            elide: Text.ElideRight
                            renderType: Text.NativeRendering
                        }
                        background: Rectangle {
                            color: Qt.rgba(64/255, 64/255, 78/255, 1);
                            radius: 1
                        }
                    }
                    SpinBox {
                        width: 50;
                        height: 20;
                        background: Rectangle {
                            color: Qt.rgba(64/255, 64/255, 78/255, 1);
                            radius: 1
                        }
                    }
                    SpinBox {
                        width: 50;
                        height: 20;
                        background: Rectangle {
                            color: Qt.rgba(64/255, 64/255, 78/255, 1);
                            radius: 1
                        }
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
