import QtQuick 2.11
import QtQuick.Window 2.0
import QtQuick.Dialogs

Window {
    id: rootObject;
    visible: true;
    width: 1120;
    height: 720;

    objectName: "rootObject";
    color: Qt.rgba(13/255, 13/255, 17/255,1.0);

    property string filepath: ""


    title: qsTr("Holy Watermark Remover");

    property var editVideoComp;
    property var editVideoView;
    property var editImageComp;
    property var editImageView;

    WelcomePage {
        anchors.centerIn: parent;

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                fileDialog.open();
            }
        }
    }

    HistoryPage {
        width: parent.width -20;
        height: 120;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.margins: 10;
    }

    function openVideoEditPage(){
        if (rootObject.editVideoComp === undefined){
            rootObject.editVideoComp = Qt.createComponent("EditVideoPage.qml");
        }

        if (rootObject.editVideoView === undefined){
            rootObject.editVideoView = rootObject.editVideoComp.createObject(rootObject, {"focus": true});
            rootObject.editVideoView.back.connect(rootObject.onEditVideoViewBack);
            rootObject.editVideoView.openFile(filepath);
        }
    }

    function openImageEditPage(){
        if (rootObject.editImageComp === undefined){
            rootObject.editImageComp = Qt.createComponent("EditImagePage.qml");
        }

        if(rootObject.editImageView === undefined){
            rootObject.editImageView = rootObject.editImageComp.createObject(rootObject, {"focus": true});
            rootObject.editImageView.back.connect(rootObject.onEditImageViewBack());
            rootObject.editImageView.openFile(filepath);
        }
    }

    function onEditVideoViewBack(){
        editVideoView.destroy();
        editVideoView = undefined;
    }

    function onEditImageViewBack(){
        editImageView.destroy();
        editImageView = undefined;
    }

    Theme {
        id: theme;
    }

    FileDialog {
        id: fileDialog;
        title: "Please select a image or video file";
        nameFilters: ["Image Files (*.jpg *.png *.bmp)", "Video File (*.mp4 *.mkv)", "* (*.*)"];
//        selectedNameFilter: "Image Files (*.jpg *.png *.mp4 *.mkv)";
        onAccepted: {
            filepath = fileDialog.selectedFile
            console.log('==>' + filepath);

            var file = new String(fileDialog.selectedFile);
            console.log("==>> file:" + file.slice(8));

            openVideoEditPage();
        }
    }

    Component.onCompleted: {
//         rootObject.flags |= Qt.WindowStaysOnTopHint
    }
}
