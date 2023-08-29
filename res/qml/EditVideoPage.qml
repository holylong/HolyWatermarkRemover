import QtQuick 2.11
import QtQuick.Controls 2.15

Window {
    id: editVideoPage;
//    anchors.fill: parent;
    
    width: 1120;
    height: 720;
    visible: true;
    
    signal back();

    color: Qt.rgba(15/255, 15/255, 16/255, 1);

    Component {
        id: frameDelegate;
        Rectangle {
            width: 60;
            height: 40;
            visible: true;
            Image {
                anchors.fill: parent;
                fillMode: Image.PreserveAspectFit;
                source: modelData;
            }
        }
    }

    // 横向整体布局
    Row {
       spacing: 6;
       anchors.fill: parent;

       // 纵向整体布局
       Column {
           spacing: 6;
           height: parent.height;
           anchors.topMargin: 5;

           // 项目管理器
           Rectangle {
               color: Qt.rgba(32/255, 32/255, 40/255, 1);
               radius:10;
               id: prokop;
               height: 70;
               
               width: editVideoPage.width - areaLayout.width - 10;
               
               Row {
                   spacing: 2;
                   anchors.fill: parent;
                   anchors.verticalCenter: parent.verticalCenter;

                   FlatIconButton {
                       anchors.verticalCenter: parent.verticalCenter;
                       anchors.left: parent.left;
                       anchors.leftMargin: 10;
                       id: newProjBtn;
                       iconSource: "../icons/plus.svg";
                       bnHeight: 50;
                       bnWidth: 80;
                       iconWidth: 20;
                       iconHeight: 20;
                       color: Qt.rgba(64/255, 64/255, 78/255, 1);
                   }

                   HistoryView {
                       anchors.verticalCenter: parent.verticalCenter;
                       anchors.left: newProjBtn.right;
                       anchors.leftMargin:15;
                       historyListViewWidth: parent.width;
                       historyListItemHeight: 50;
                       historyListItemWidth: 80;
                       historyListItemImageHeight: 49;
                       height: 50;
                       width: parent.width - newProjBtn.width - 10;       
                   }
               }
           }

           // 主edit界面
           Rectangle {
               width: editVideoPage.width - 260;
               height: editVideoPage.height - processBar.height - prokop.height - 20;
               id: editorView
               color: Qt.rgba(32/255, 32/255, 100/255, 1);
               visible: true;
               radius:10;
               opacity: 0.5
               Image {
                   id: nameImage
                   source: "../images/mainui.jpg"
                   anchors.fill: parent;
                   fillMode: Image.PreserveAspectFit;
               }
           }

           // progressbar界面
           Rectangle {
                id: processBar;
                height: 80;
                radius: 10;
                width: editVideoPage.width - areaLayout.width - 8;
                color: Qt.rgba(32/255, 32/255, 40/255, 1);
                anchors.topMargin: 10;

                Row {
                    spacing: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                    FlatIconButton {
                        id: playIconButton;
                        bnWidth: 60;
                        bnHeight: 60;
                        iconHeight: 40;
                        iconWidth: 40;
                        iconSource: "../icons/play.svg"
                        z: 1;
                    }

                    ListView {
                        layoutDirection: ListView.LeftToRight;
                        z: 0;
                        orientation: Qt.Horizontal;
                        anchors.verticalCenter: parent.verticalCenter;
                        width: editVideoPage.width - areaLayout.width - 8;
                        height: 40;
                        model: ["file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                                "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                            "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",
                        "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/1614075144505.jpg",]
                        delegate: frameDelegate;
                    }
                }
           }
       }

       // Area选择区
       Column {
        anchors.right: parent.right;
        id: areaLayout;
        spacing: 3;
        height: parent.height;
        AreaSelectPage{
            id: areaSelect;
            height: editVideoPage.height/2;
            width: editVideoPage.width - editorView.width - 6;
        }
        ImExportPage {
            height: editVideoPage.height/2;
        }
       }
    }

    Component.onCompleted: {
        console.log("==>> load ok");
    }

    function openFile(path){
        console.log(path)
        nameImage.source = path;
    }
}
