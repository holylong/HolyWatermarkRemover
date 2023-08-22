import QtQuick 2.11

Rectangle {
    anchors.fill: parent;

    signal back();

    Image {
        id: nameImage
        source: "file"
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent;
    }

    function openFile(path){
        console.log(path)
        nameImage.source = path;
    }
}
