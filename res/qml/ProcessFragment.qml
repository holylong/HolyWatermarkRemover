import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 200
    title: "视频播放进度片段选择器"

    Rectangle {
		id: processBar;
        width: parent.width
        height: parent.height

        // 视频总时长
        property real videoDuration: 100

        // 左侧选择区间
        property real leftPosition: 0

        // 右侧选择区间
        property real rightPosition: videoDuration

        // 当前播放位置
        property real currentPosition: 0

        Rectangle {
            width: parent.width
            height: 10
            color: "lightgray"

            // 左侧选择区域
            Rectangle {
                width: processBar.leftPosition * parent.width / processBar.videoDuration
                height: parent.height
                color: "blue"

                MouseArea {
                    anchors.fill: parent
                    drag.target: parent

                    onPositionChanged: {
                        if (mouseX >= 0 && mouseX <= processBar.rightPosition * parent.width / processBar.videoDuration) {
                            processBar.leftPosition = mouseX * processBar.videoDuration / parent.width;
                        }
                    }
                }
            }

            // 右侧选择区域
            Rectangle {
                width: (processBar.rightPosition - processBar.leftPosition) * parent.width / processBar.videoDuration
                height: parent.height
                color: "green"

                MouseArea {
                    anchors.fill: parent
                    drag.target: parent

                    onPositionChanged: {
                        if (mouseX >= processBar.leftPosition * parent.width / processBar.videoDuration &&
                            mouseX <= parent.width) {
                            processBar.rightPosition = mouseX * processBar.videoDuration / parent.width;
                        }
                    }
                }
            }

            // 当前播放位置
            Rectangle {
                width: 2
                height: parent.height
                color: "red"
                x: processBar.currentPosition * parent.width / processBar.videoDuration
            }
        }
    }
}