import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    radius: 5;
    color: Qt.rgba(32/255, 32/255, 40/255, 1)
    visible: true;

    property alias historyListViewWidth: historyListView.width;
    property alias historyListViewHeight: historyListView.height;
    property real historyListItemHeight: 60;
    property real historyListItemImageHeight: 55;
    property real historyListItemWidth: 105;
 
    Component {
        id: historyDelegate;
        
        Rectangle {
            anchors.verticalCenter: parent.verticalCenter;
            width: historyListItemWidth;
            height: historyListItemHeight;
            radius: 8;
            visible: true;
            color: Qt.rgba(0,0,0,1);

            property bool isHovered: false;
            property bool isLabelHovered: false;
            opacity: 1;

            MouseArea {
                anchors.fill: parent;
                hoverEnabled: true;
                onEntered: {
                    isHovered = true;
                }

                onExited: {
                    isHovered = isLabelHovered;
                }
            }

            Image {
                source: modelData;
                fillMode: Image.PreserveAspectFit;
                width: 90;
                height: historyListItemImageHeight;
                anchors.centerIn: parent;
            }

            Label {
                text: "00:15";
                width: 40;
                height: 20;
                anchors.right: parent.right;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 1;
                font.pixelSize: 15;
                color: "#ffffff";
            }

            Rectangle {
//                visible: isHovered;
                width: 15;
                height: 15;
                anchors.top: parent.top;
                anchors.topMargin: -5;
                anchors.right: parent.right;
                anchors.rightMargin: -5;
                color: "transparent";

                Image {
                    source: "../icons/delete.svg";
                    fillMode: Image.PreserveAspectFit;

                    anchors.fill: parent;
                    visible: isHovered;
                }

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("==>> is clicked");
                    }

                    ToolTip {
                        delay: 50;
                        visible: isLabelHovered;

                        contentItem: Text{
                            color: "#ffffff";
                            text: qsTr("id_delete_project");
                        }

                        background: Rectangle{
//                            border.color: "green"
//                            color: theme.backgroundDark;
                            color: Qt.rgba(64/255, 64/255, 78/255, 1)
                            radius: 4
                        }
                    }

                    hoverEnabled: true;
                    onEntered: {
                        isHovered = true;
                        isLabelHovered = true;
                    }

                    onExited: {
                        isHovered = false;
                        isLabelHovered = false;
                    }
                }
            }
        }
    }

    ListView {
        id: historyListView;
        layoutDirection: ListView.LeftToRight;
        orientation: Qt.Horizontal;
        height: parent.height;
        width: parent.width - 50;
        spacing: 10;

        anchors.verticalCenter: parent.verticalCenter;

        model: ["file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/image_4.jpg",
            "file:///C:/Users/mrhli/Pictures/1614075144505.jpg", "file:///C:/Users/mrhli/Pictures/image_4.jpg"]

        delegate: historyDelegate;
    }

    FlatIconButton {
        iconSource: "../icons/deleteall.svg";
        iconWidth: 20;
        iconHeight: 20;
        bnWidth: 40;
        bnHeight: 40;
        anchors.right: parent.right;
        anchors.rightMargin:10;
        anchors.verticalCenter: parent.verticalCenter;

        hoveredMsg: qsTr("id_delete_all_project");
    }
}
