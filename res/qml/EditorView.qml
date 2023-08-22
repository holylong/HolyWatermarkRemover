import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: "视频编辑器"

    menuBar: MenuBar {
        Menu {
            title: "文件"
            MenuItem {
                text: "打开"
            }
            MenuItem {
                text: "保存"
            }
            MenuItem {
                text: "另存为..."
            }
        }
        Menu {
            title: "编辑"
            MenuItem {
                text: "撤销"
            }
            MenuItem {
                text: "重做"
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Button {
                text: "剪切"
                onClicked: console.log("剪切")
            }
            Button {
                text: "复制"
                onClicked: console.log("复制")
            }
            Button {
                text: "粘贴"
                onClicked: console.log("粘贴")
            }
        }

        VideoOutput {
            id: videoOutput
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Slider {
                id: slider
                Layout.fillWidth: true
                from: 0
                to: 100
                value: 50
                onValueChanged: console.log("时间轴滑块值改变")
            }
        }
    }

    Component.onCompleted: console.log("窗口加载完成")
}
