import QtQuick 2.15
import QtMultimedia 5.15

ApplicationWindow {
    id: appWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Multi-screen Video Player")

    Grid {
        id: grid
        rows: 2
        columns: 2
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10

        VideoOutput {
            id: video1
            source: player1 //绑定MediaPlayer组件
            fillMode: VideoOutput.PreserveAspectFit //按比例缩放并适应单元格大小

            MouseArea {
                anchors.fill: parent //填充整个VideoOutput组件

                onClicked: {
                    if (player1.playbackState == MediaPlayer.PlayingState) {
                        player1.pause() //如果正在播放，点击暂停
                    } else {
                        player1.play() //如果暂停或停止，点击播放
                    }
                }
            }
        }

        MediaPlayer {
            id: player1
            source: "video1.mp4" //指定视频文件路径
            autoPlay: true //自动播放
        }

        VideoOutput {
            id: video2
            source: player2 //绑定MediaPlayer组件
            fillMode: VideoOutput.PreserveAspectFit //按比例缩放并适应单元格大小

            MouseArea {
                anchors.fill: parent //填充整个VideoOutput组件

                onClicked: {
                    if (player2.playbackState == MediaPlayer.PlayingState) {
                        player2.pause() //如果正在播放，点击暂停
                    } else {
                        player2.play() //如果暂停或停止，点击播放
                    }
                }
            }
        }

        MediaPlayer {
            id: player2
            source: "video2.mp4" //指定视频文件路径
            autoPlay: true //自动播放
        }

        VideoOutput {
            id: video3
            source: player3 //绑定MediaPlayer组件
            fillMode: VideoOutput.PreserveAspectFit //按比例缩放并适应单元格大小

            MouseArea {
                anchors.fill: parent //填充整个VideoOutput组件

                onClicked: {
                    if (player3.playbackState == MediaPlayer.PlayingState) {
                        player3.pause() //如果正在播放，点击暂停
                    } else {
                        player3.play() //如果暂停或停止，点击播放
                    }
                }
            }
        }

        MediaPlayer {
            id: player3
            source: "video3.mp4" //指定视频文件路径
            autoPlay: true //自动播放
        }

        VideoOutput {
            id: video4
            source: player4 //绑定MediaPlayer组件
            fillMode: VideoOutput.PreserveAspectFit //按比例缩放并适应单元格大小

            MouseArea {
                anchors.fill: parent //填充整个VideoOutput组件

                onClicked: {
                    if (player4.playbackState == MediaPlayer.PlayingState) {
                        player4.pause() //如果正在播放，点击暂停
                    } else {
                        player4.play() //如果暂停或停止，点击播放
                    }
                }
            }
        }

        MediaPlayer {
            id: player4
            source: "video4.mp4" //指定视频文件路径
            autoPlay: true //自动播放
        }
    }
}