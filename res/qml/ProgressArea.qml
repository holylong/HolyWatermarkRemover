import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: appWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Selector")

    property real leftX: 0 //选区左边界相对于进度条背景的x坐标
    property real rightX: 100 //选区右边界相对于进度条背景的x坐标

    Rectangle {
        id: progressBarBg //进度条背景
        x: 10
        y: 10
        width: appWindow.width - 20
        height: 40
        color: "gray"

        Image {
            id: progressBarFg //进度条前景
            anchors.fill: parent
            source: "video.mp4" //视频文件路径
            fillMode: Image.PreserveAspectCrop //按比例裁剪并填充

            Item {
                id: selectorContainer //选区容器
                anchors.fill: parent
                clip: true //超出边界不显示

                Rectangle {
                    id: leftBorder //选区左边界
                    x: leftX
                    y: 0
                    width: 5
                    height: parent.height
                    color: "red"
                }

                Rectangle {
                    id: rightBorder //选区右边界
                    x: rightX
                    y: 0
                    width: 5
                    height: parent.height
                    color: "red"
                }

                Rectangle {
                    id: selectorBody //选区主体
                    x: leftBorder.x + leftBorder.width
                    y: 0
                    width: rightBorder.x - leftBorder.x - leftBorder.width
                    height: parent.height
                    color: "blue"
                    opacity: 0.5 //半透明
                }

                MouseArea {
                    id: leftBorderArea //选区左边界触发区域
                    anchors.fill: leftBorder
                    cursorShape: Qt.SizeHorCursor //水平调整指针

                    property real xPosition: 0 //鼠标按下时的x坐标

                    onPressed: {
                        xPosition = mouse.x //记录鼠标按下时的x坐标
                    }

                    onPositionChanged: {
                        var xOffset = mouse.x - xPosition //计算鼠标移动的偏移量

                        if (selectorContainer.x + leftBorder.x + xOffset > 0 && leftBorder.x + xOffset < rightBorder.x - leftBorder.width) {
                            //如果左边界不超出容器的范围，并且不超过右边界，更新leftX的值
                            leftX = leftX + xOffset
                        }
                    }
                }

                MouseArea {
                    id: rightBorderArea //选区右边界触发区域
                    anchors.fill: rightBorder
                    cursorShape: Qt.SizeHorCursor //水平调整指针

                    property real xPosition: 0 //鼠标按下时的x坐标

                    onPressed: {
                        xPosition = mouse.x //记录鼠标按下时的x坐标
                    }

                    onPositionChanged: {
                        var xOffset = mouse.x - xPosition //计算鼠标移动的偏移量

                        if (selectorContainer.x + rightBorder.x + xOffset < selectorContainer.width && rightBorder.x + xOffset > leftBorder.x + leftBorder.width) {
                            //如果右边界不超出容器的范围，并且不超过左边界，更新rightX的值
                            rightX = rightX + xOffset
                        }
                    }
                }

                MouseArea {
                    id: selectorBodyArea //选区主体触发区域
                    anchors.fill: selectorBody
                    cursorShape: Qt.SizeAllCursor //全方位移动指针

                    property real xPosition: 0 //鼠标按下时的x坐标

                    onPressed: {
                        xPosition = mouse.x //记录鼠标按下时的x坐标
                    }

                    onPositionChanged: {
                        var xOffset = mouse.x - xPosition //计算鼠标移动的偏移量

                        if (selectorContainer.x + leftBorder.x + xOffset > 0 && selectorContainer.x + rightBorder.x + xOffset < selectorContainer.width) {
                            //如果选区不超出容器的范围，同时更新leftX和rightX的值，保持选区长度不变
                            leftX = leftX + xOffset
                            rightX = rightX + xOffset
                        }
                    }
                }

                MouseArea {
                    id: selectorBgArea //选区背景触发区域，即进度条除了选区之外的部分
                    anchors.fill: parent

                    property real xPosition: 0 //鼠标按下时的x坐标

                    onPressed: {
                        xPosition = mouse.x //记录鼠标按下时的x坐标

                        if (mouse.x < leftBorder.x || mouse.x > rightBorder.x) {
                            //如果鼠标点击在选区之外，将选区移动到鼠标位置，保持中心对齐，同时更新leftX和rightX的值，保持选区长度不变
                            var centerX = mouse.x - selectorContainer.x //计算鼠标相对于容器的中心位置

                            if (centerX - selectorBody.width / 2 > 0 && centerX + selectorBody.width / 2 < selectorContainer.width) {
                                //如果选区不超出容器的范围，更新leftX和rightX的值
                                leftX = centerX - selectorBody.width / 2
                                rightX = centerX + selectorBody.width / 2
                            }
                        }
                    }
                }
            }
        }
    }

    Text {
        id: startTimeText //显示选区开始时间的文本
        x: progressBarBg.x
        y: progressBarBg.y + progressBarBg.height + 10
        width: 100
        height: 20
        color: "black"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        property real videoDuration: 60 //视频总时长，单位为秒，可以根据视频文件获取

        function formatTime(seconds) {
            //格式化时间，将秒数转换为分:秒的形式，如01:23
            var minutes = Math.floor(seconds / 60)
            var seconds = Math.floor(seconds % 60)
            return (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds)
        }

        text: formatTime(leftX / progressBarBg.width * videoDuration) //根据leftX的值计算选区开始时间，并格式化显示
    }

    Text {
        id: endTimeText //显示选区结束时间的文本
        x: progressBarBg.x + progressBarBg.width - width
        y: progressBarBg.y + progressBarBg.height + 10
        width: 100
        height: 20
        color: "black"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        property real videoDuration: startTimeText.videoDuration //视频总时长，与startTimeText相同

        function formatTime(seconds) {
            //格式化时间，与startTimeText相同
            return startTimeText.formatTime(seconds)
        }

        text: formatTime(rightX / progressBarBg.width * videoDuration) //根据rightX的值计算选区结束时间，并格式化显示
    }
}