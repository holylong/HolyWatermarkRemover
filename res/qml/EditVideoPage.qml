import QtQuick 2.11
import QtQuick.Layouts 1.15

Rectangle {
    anchors.fill: parent;
    signal back();

    color: Qt.rgba(15/255, 15/255, 16/255, 1)

    // 横向整体布局
    RowLayout {
       spacing: 3;

       // 纵向整体布局
       ColumnLayout {
           spacing: 3;

           Rectangle {
               color: Qt.rgba(32/255, 32/255, 40/255, 1);
               id: prokop;
               ColumnLayout {

                   spacing: 2;

                   FlatIconButton {
                       iconSource: "../icons/plus.svg";
                       bnHeight: 50;
                       bnWidth: 80;
                       iconWidth: 20;
                       iconHeight: 20;
                       color: Qt.rgba(64/255, 64/255, 78/255, 1);
                   }
               }
           }


           Rectangle {
               anchors.top: prokop.bottom;
               anchors.topMargin: 3;
               width: parent.width - 200;
               height: parent.height - 150;
               anchors.left: parent.left;
               anchors.leftMargin: 20;
               id: editorView
               color: Qt.rgba(32/255, 32/255, 100/255, 1);
               Image {
                   id: nameImage
                   source: "file"
                   anchors.fill: parent;
                   fillMode: Image.PreserveAspectFit;
               }
           }

           ColumnLayout {
               anchors.top: editorView.bottom;
               spacing: 2

               FlatIconButton {
                   anchors.leftMargin: 10;
                   bnWidth: 80;
                   bnHeight: 80;
                   iconHeight: 40;
                   iconWidth: 40;
                   iconSource: "../icons/play.svg"
               }

               ListView {

               }
           }
       }

       ColumnLayout {

       }
    }



    function openFile(path){
        console.log(path)
        nameImage.source = path;
    }
}
