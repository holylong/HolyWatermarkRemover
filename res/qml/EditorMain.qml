import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs

ApplicationWindow {
    id: window
    visible: true
    width: 600
    height: 400
    title: qsTr("Holy Watermark Remover")

    property var videoFile // the selected video file
    property bool isEditing // whether the user is editing the video or not

    FileDialog {
        id: fileDialog
        title: "Choose a video file"
        nameFilters: ["Video files (*.mp4 *.avi *.mov)"]
        onAccepted: {
            videoFile = new String(fileDialog.fileUrl) // set the video file property
            isEditing = true // switch to editing mode
        }
    }

    Rectangle {
        id: mainView // the main view for selecting video or picture
        anchors.fill: parent
        color: "#333333"
        visible: !isEditing // only visible when not editing

        Image {
            id: icon
            source: ":/HolyWatermarkRemover/res/icons/holy.svg" // TODO: replace with the actual icon image
            width: 100
            height: 100
            anchors.centerIn: parent
        }

        Text {
            id: text
            text: qsTr("点击选择要去除水印的视频或图片")
            color: "white"
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: icon.bottom
            anchors.topMargin: 10
        }

        Button {
            id: button
            text: qsTr("选择视频或图片")
            width: 200
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            onClicked: fileDialog.open() // open the file dialog to choose a video file
        }

        Image {
            id: thumbnail
            source: ":/HolyWatermarkRemover/res/welcome_earth.jpg" // TODO: replace with the actual video thumbnail image from history records
            width: 100
            height: 100
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    videoFile = thumbnail.source // set the video file property from history records
                    isEditing = true // switch to editing mode
                }
            }
        }

        Text {
            id: timer
            text: "00:33"
            color: "white"
            font.pixelSize: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            // TODO: show the video duration from history records or metadata
        }
    }

    Rectangle {
        id: editView // the edit view for removing watermark from video or picture
        anchors.fill : parent
        color : "#000000"
        visible : isEditing // only visible when editing

        Image {
           id : logo
           source : ":/HolyWatermarkRemover/res/icons/holy.svg" // TODO : replace with the actual logo image
           width : 50
           height : 50
           anchors.left : parent.left
           anchors.top : parent.top
           anchors.margins : 10
       }

       Text {
           id : title
           text : qsTr("Holy Watermark Remover")
           color : "white"
           font.pixelSize : 20
           font.bold : true
           anchors.left : logo.right
           anchors.leftMargin : 10
           anchors.verticalCenter : logo.verticalCenter
       }

       Button {
           id : greenButton
           text : qsTr("开始去除水印") // TODO : change the text according to the actual function
           width : 150
           height : 40
           background : Rectangle { color : "#00ff00" } // green background
           anchors.right : parent.right
           anchors.top : parent.top
           anchors.margins : 10

           // TODO : add logic to handle button click and start removing watermark from video or picture
       }

       Rectangle {
           id : videoBox
           width : parent.width - 20
           height : parent.height * 0.6 - 20
           color : "#333333" // dark grey background
           border.width : 1 // white border
           border.color : "white"
           anchors.horizontalCenter : parent.horizontalCenter
           anchors.top : logo.bottom
           anchors.topMargin : 10

           // TODO : add logic to load and display the selected video or picture file
       }

       ProgressBar {
           id : loadingBar
           width : videoBox.width - 20
           height : 20
           from : 0 // minimum value
           to : 100 // maximum value
           value : 0 // current value
           visible : false // only visible when loading
           anchors.horizontalCenter : videoBox.horizontalCenter
           anchors.verticalCenter : videoBox.verticalCenter

           // TODO : add logic to update the loading progress and show or hide the loading bar
       }

       Text {
           id : loadingText
           text : qsTr("Loading...")
           color : "white"
           font.pixelSize : 20
           visible : false // only visible when loading
           anchors.horizontalCenter : videoBox.horizontalCenter
           anchors.bottom : loadingBar.top

           // TODO : add logic to show or hide the loading text
       }

       Slider {
           id : timeline
           width : videoBox.width - 20
           height : 20
           from : 0 // minimum value
           to : 100 // maximum value
           value : 0 // current value
           anchors.horizontalCenter : videoBox.horizontalCenter
           anchors.top : videoBox.bottom

           // TODO : add logic to update the timeline value and handle user input to seek the video or picture file
       }

       Button {
           id : playButton
           text : qsTr("▶") // play icon as text, can be replaced by an image source if needed
           width: 40
            height: 40
            background: Rectangle { color: "#800080" } // purple background
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 10

            // TODO: add logic to handle button click and play or pause the video or picture file
        }

        Button {
            id: blueButton
            text: qsTr("导出视频或图片") // TODO: change the text according to the actual function
            width: 150
            height: 40
            background: Rectangle { color: "#0000ff" } // blue background
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10

            // TODO: add logic to handle button click and export the video or picture file without watermark
        }
    }
}
