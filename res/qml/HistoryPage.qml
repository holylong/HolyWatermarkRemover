import QtQuick 2.11

Rectangle {
    radius: 5;
    color: Qt.rgba(32/255, 32/255, 40/255, 1)
    visible: true;

    Text {
        id: title
        text: qsTr("id_title_project");
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 10;
        font.pointSize: 12;
        font.bold: true;
        color: "white";
        width: 0;
    }

    HistoryView {
        height: 80;
        historyListViewHeight: 90;
        historyListItemHeight: 60;
        historyListItemImageHeight: 55;
        width: parent.width - 30;
        anchors.top: title.bottom;
        anchors.topMargin: 11;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }
}
