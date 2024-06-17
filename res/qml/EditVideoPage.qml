import QtQuick 2.11
import QtQuick.Controls 2.15

Rectangle {
    id: editVideoPage;
    anchors.fill: parent;
    
//    width: 1120;
//    height: 720;
//    visible: true;
    
    signal back();
    property bool editorRectVisiable: true;

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
                source: imageData;
            }
        }
    }

    // 横向整体布局
    Row {
       spacing: 3;
       anchors.fill: parent;

       // 纵向整体布局
       Column {
           spacing: 3;
           height: parent.height;
           anchors.topMargin: 5;

           // 项目管理器
           Rectangle {
               color: Qt.rgba(32/255, 32/255, 40/255, 1);
               radius:10;
               id: prokop;
               height: 70;
               
               width: editVideoPage.width - areaLayout.width - 4;
               
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
                       hoveredMsg: qsTr("新建项目");
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
                       width: parent.width - newProjBtn.width - 30;
                   }
               }
           }

           // 主edit界面
           Rectangle {
               width: editVideoPage.width - 260;
               height: editVideoPage.height - processBar.height - prokop.height - 40;
               id: editorView
               color: Qt.rgba(32/255, 32/255, 50/255, 1);
               visible: true;
               radius:10;
//               opacity: 0.5
               Image {
                   id: nameImage
                   source: "../images/mainui.jpg"
                   anchors.fill: parent;
                   fillMode: Image.PreserveAspectFit;
//                   color: Qt.rgba(32/255, 32/255, 50/255, 1);
               }

               Rectangle {
                   visible: editorRectVisiable;
//                   border.color: Qt.rgba(0, 135/255, 135/255, 1);
                   border.color: Qt.rgba(236/255, 246/255, 182/255, 1)
                   border.width: 4;

                   id: blueSquare;
                   width: 100;
                   height: 100;
                   color: "transparent";

                   MouseArea {
                       anchors.fill: parent;
                       drag.target: blueSquare;
                       drag.axis: Drag.XAndYAxis;
                       drag.minimumX: 0;
                       drag.minimumY: 0;
                       drag.maximumX: editorView.width - blueSquare.width;
                       drag.maximumY: editorView.height - blueSquare.height;
                   }

                   ResizeRectangle {
                       resizeTarget: blueSquare;
                   }
               }
           }

           SpinAreaBar {
               width: editVideoPage.width - 260;
           }

           // progressbar界面
           Rectangle {
                id: processBar;
                height: 95;
                radius: 10;
                width: editVideoPage.width - areaLayout.width - 4;
                color: Qt.rgba(32/255, 32/255, 40/255, 1);
                anchors.topMargin: 10;

                Rectangle {
                    height: 15;
                    id: posNeedle;
                    width: 100;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    color: Qt.rgba(32/255, 32/255, 40/255, 1);
                    Label {
                        text: "001:51:123"
                        color: Qt.rgba(1,1,1,1);
                        font.pixelSize: 10;
                        id: curNeedle;
                    }
                    Label {
                        id: curNeedleFlag
                        anchors.left: curNeedle.right;
                        text: " / "
                        color: Qt.rgba(1,1,40/255,1);
                        font.pixelSize: 10;
                    }
                    Label {
                        anchors.left: curNeedleFlag.right;
                        text: "002:56:900"
                        color: Qt.rgba(1,1,40/255,1);
                        font.pixelSize: 10;
                    }
                }

                Row {
                    spacing: 10;
                    anchors.top: posNeedle.bottom;
//                    anchors.verticalCenter: parent.verticalCenter;

                    Rectangle {
                        width: 50;
                        height: 80;
                        z:2;
                        color: Qt.rgba(32/255, 32/255, 40/255, 1);
                        id: playIconContainer;
                        anchors.verticalCenter: parent.verticalCenter;
                        IconButton {
                            anchors.centerIn: parent;
                            id: playIconButton;
                            anchors.verticalCenter: parent.verticalCenter;
                            width: 30;
                            height: 30;
                            iconSource: "../icons/play.svg"
                            z: 2;
                            hoveredMsg: qsTr("id_play_video");
                        }
                    }

                    Rectangle {
                        id: processEditor;
                        width: editVideoPage.width - areaLayout.width - playIconContainer.width - 20;
                        height: 80;
                        radius: 10;
                        color: Qt.rgba(32/255, 32/255, 40/255, 1);

                        ListView {
                            layoutDirection: ListView.LeftToRight;
                            z: 0;
                            orientation: Qt.Horizontal;
                            anchors.verticalCenter: parent.verticalCenter;
                            width: editVideoPage.width - areaLayout.width - playIconContainer.width - 38;
                            height: 40;
                            model: videoEditor.model
                            delegate: frameDelegate;
//                            delegate: Item {
//                                width: parent.width
//                                height: 200

//                                Image {
//                                    source: imageData
//                                    fillMode: Image.PreserveAspectCrop
//                                    anchors.fill: parent
//                                }
//                            }
                        }

                        Rectangle {
                            visible: editorRectVisiable;
                            border.color: Qt.rgba(236/255, 246/255, 182/255, 1)
                            border.width: 1;
                            anchors.verticalCenter: parent.verticalCenter;
                            id: dragRectangle;
                            width: 100;
                            height: 60;
                            color: "transparent";

                            MouseArea {
                                anchors.fill: parent;
                                drag.target: dragRectangle;
                                drag.axis: Drag.XAndYAxis;
                                drag.minimumX: 0;
                                drag.minimumY: 0;
                                drag.maximumX: processEditor.width - dragRectangle.width - 8;
                                drag.maximumY: 0;
                            }

                            DragRectangle {
                                resizeTarget: dragRectangle;
                            }
                        }

                        Rectangle {
                            visible: editorRectVisiable;
                            width: 4;
                            height: 80;
                            anchors.verticalCenter: parent.verticalCenter;
                            id: dragNeedle;

                            color: "yellow";

                            MouseArea {
                                anchors.fill: parent;
                                drag.target: dragNeedle;
                                drag.axis: Drag.XAndYAxis;
                                drag.minimumX: 0;
                                drag.minimumY: 0;
                                drag.maximumX: processEditor.width - playIconContainer.width + 20;
                                drag.maximumY: 0;
                            }
                        }
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
