import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    id: rootWindow;
     width: 261; height: 300
     visible: true;
     color: Qt.rgba(32/255, 32/255, 40/255, 1);

     Component {
         id: contactDelegate
         Rectangle {
             id: wrapperRect;
             width: 240; height: 60;
             anchors.horizontalCenter: parent.horizontalCenter;
             radius: 10;
             color: Qt.rgba(46/255, 46/255, 56/255, 1);

             MouseArea {
                 anchors.fill: parent;
                 onClicked: wrapperRect.ListView.view.currentIndex = index;
             }

             Row {
                 spacing: 5;
                 anchors.verticalCenter: parent.verticalCenter;
                 anchors.left: parent.left;
                 anchors.leftMargin: 10;
                 Column {
                     spacing: 6;
                     width: wrapperRect.width - 40;
                     Text {
                         text: '<b>Area:</b> ' + name
                         color: "white"
                     }
                     Text {
                         text: '000:17:345' + ' - ' + '000:35:134'
                         color: "white"
                     }
                 }
                 IconButton {
                     width: 20;
                     height: 20;
                     iconSource: "../icons/deleteall.svg"
                 }
             }
         }
     }

     ListView {
         anchors.margins: 5;
         anchors.fill: parent;
         model: AreaModel {}
         delegate: contactDelegate
         highlight: Rectangle {
             color: "transparent";
             radius: 10;
             border.color: Qt.rgba(143/255, 128/255, 1, 1);
             border.width: 2;
             width: 240; height: 60;
             z:2;
             anchors.horizontalCenter: parent.horizontalCenter;
         }
         focus: true;
         spacing: 5;
     }
 }
