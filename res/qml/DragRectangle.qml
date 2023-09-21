import QtQuick 2.0

Item {
    id:rect
    property int minimumWidth: 1
    property int minimumHeight: 1
    property int mouseRegion: 5
    property var resizeTarget: rect
    anchors.fill: resizeTarget

    Rectangle {
        width: 4;
        height: parent.height;
        x: leftX.x;
        y: parent.y;
        color: "blue";
    }

    Rectangle {
        width: 4;
        height: parent.height;
        x: rightX.x + 4;
        y: parent.y;
        color: "blue";
    }

    //左边框
    MouseArea {
        id:leftX
        width: mouseRegion
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeHorCursor
        property int xPosition: 0
        onPressed: {
            xPosition = mouse.x
        }

        onPositionChanged: {
            var xOffset = mouse.x-xPosition
            if(rect.resizeTarget.x+xOffset>0 && rect.resizeTarget.width-xOffset>minimumWidth){
                rect.resizeTarget.x = rect.resizeTarget.x+xOffset
                rect.resizeTarget.width = rect.resizeTarget.width-xOffset
            }
        }
    }

    // 右边框
    MouseArea{
        id:rightX
        width: mouseRegion
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 0
        cursorShape: Qt.SizeHorCursor
        property int xPosition: 0
        onPressed: {
            xPosition = mouse.x
        }

        onPositionChanged: {
            var xOffset = mouse.x-xPosition
            var xWidth = rect.resizeTarget.width+xOffset
            var availableWidth = rect.resizeTarget.parent ? rect.resizeTarget.parent.width:Screen.desktopAvailableWidth
            if(xWidth+rect.resizeTarget.x<availableWidth && xWidth>minimumWidth){
                rect.resizeTarget.width = xWidth
            }
        }
    }
}
