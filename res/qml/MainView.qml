import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true;
    width: 1120;
    height: 723;
    color: Qt.rgba(13/256, 13/256, 17/256, 1)

//    Rectangle {
//        anchors.horizontalCenter: parent.horizontalCenter;
//        anchors.verticalCenter: parent.verticalCenter;
//        width: 511;
//        height: 285;
//        color: Qt.rgba(0.1, 0.1, 0.1, 1);
//        radius: 10;
//    }

    TransparentWelcomePage {
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        width: 511;
        height: 285;
        radius: 10;
    }

    HistoryView {
        width: parent.width -10;
        height: 100;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.margins: 10;
    }

    Component.onCompleted: {
        window.flags |= Qt.WindowStaysOnTopHint
    }
}
