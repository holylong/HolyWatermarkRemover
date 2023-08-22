import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: "HitPaw 水印去除器"

    color: "black"

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Image {
                source: "logo.png"
                fillMode: Image.PreserveAspectFit
            }

            Item {
                Layout.fillWidth: true
            }

            Button {
                text: "绿色按钮"
                background: Rectangle {
                    color: "green"
                }
            }
        }

        Rectangle {
            id: videoBox
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: "black"

            TextField {
                anchors.centerIn: parent
                placeholderText: "文本框"
                color: "white"
            }

            Button {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "提交"
                background: Rectangle {
                    color: "gray"
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Item {
                Layout.fillWidth: true
            }

            Button {
                text: "开始"
                background: Rectangle {
                    color: "purple"
                }
            }
        }

        Rectangle {
            id: sidePanel
            Layout.preferredWidth: 200
            Layout.fillHeight: true

            color: "gray"

            Text {
                anchors.centerIn: parent
                text: "侧边栏文本"
                color: "black"
            }
        }
    }
}
