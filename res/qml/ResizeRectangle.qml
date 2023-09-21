import QtQuick 2.0
import QtQuick.Window 2.15
 
Item {
    id:rect
    property int minimumWidth: 1
    property int minimumHeight: 1
    property int mouseRegion: 5
    property var resizeTarget: rect
    anchors.fill: resizeTarget

    Rectangle {
        id: leftUp;
        color: "blue";
        width: 8;
        height: 8;
        x: leftX.x-1;
        y: leftX.y-1;
    }

    Rectangle {
        id: rightBottom;
        color: "blue";
        width: 8;
        height: 8;
        x: rightX.x -1;
        y: bottomY.y -1;
    }

    Rectangle {
        id: leftBottom;
        color: "blue";
        width: 8;
        height: 8;
        x: leftX.x - 1;
        y: bottomY.y - 1;
    }

    Rectangle {
        id: rightTop;
        color: "blue";
        width: 8;
        height: 8;
        x: rightX.x - 1;
        y: topY.y - 1;
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

    // 上边框
    MouseArea{
        id:topY
        height: mouseRegion
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor
        property int yPosition: 0
        onPressed: {
            yPosition = mouse.y
        }
 
        onPositionChanged: {
            var yOffset = mouse.y-yPosition
            if(rect.resizeTarget.y+yOffset>0 && rect.resizeTarget.height-yOffset>minimumHeight){
                rect.resizeTarget.y = rect.resizeTarget.y+yOffset
                rect.resizeTarget.height = rect.resizeTarget.height-yOffset
            }
        }
    }
 
    // 下边框
    MouseArea{
        id:bottomY
        height: mouseRegion
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor
        property int yPosition: 0
        onPressed: {
            yPosition = mouse.y
        }
 
        onPositionChanged: {
            var yOffset = mouse.y-yPosition
            var yHeight = rect.resizeTarget.height+yOffset
            var availableHeight = rect.resizeTarget.parent ? rect.resizeTarget.parent.height : Screen.desktopAvailableHeight
            if(yHeight+rect.resizeTarget.y<availableHeight && yHeight>minimumHeight){
                rect.resizeTarget.height = yHeight
            }
        }
    }
 
    // 左上角
    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        cursorShape: Qt.SizeFDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouse.x
            yPosition = mouse.y
        }
 
        onPositionChanged: {
            var xOffset = mouse.x-xPosition
            if(rect.resizeTarget.x+xOffset>0 && rect.resizeTarget.width-xOffset>minimumWidth){
                rect.resizeTarget.x = rect.resizeTarget.x+xOffset
                rect.resizeTarget.width = rect.resizeTarget.width-xOffset
            }
            var yOffset = mouse.y-yPosition
            if(rect.resizeTarget.y+yOffset>0 && rect.resizeTarget.height-yOffset>minimumHeight){
                rect.resizeTarget.y = rect.resizeTarget.y+yOffset
                rect.resizeTarget.height = rect.resizeTarget.height-yOffset
            }
        }
    }
 
    // 右上角
    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        cursorShape: Qt.SizeBDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouse.x
            yPosition = mouse.y
        }
 
        onPositionChanged: {
            var xOffset = mouse.x-xPosition
            var xWidth = rect.resizeTarget.width+xOffset
            var availableWidth = rect.resizeTarget.parent ? rect.resizeTarget.parent.width:Screen.desktopAvailableWidth
            var availableHeight = rect.resizeTarget.parent ? rect.resizeTarget.parent.height : Screen.desktopAvailableHeight
 
            if(xWidth+rect.resizeTarget.x<availableWidth && xWidth>minimumWidth){
                rect.resizeTarget.width = xWidth
            }
            var yOffset = mouse.y-yPosition
            if(rect.resizeTarget.y+yOffset>0 && rect.resizeTarget.height-yOffset>minimumHeight){
                rect.resizeTarget.y = rect.resizeTarget.y+yOffset
                rect.resizeTarget.height = rect.resizeTarget.height-yOffset
            }
        }
    }
 
    // 左下角
    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeBDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouse.x
            yPosition = mouse.y
        }
        onPositionChanged: {
            var xOffset = mouse.x-xPosition
            var availableWidth = rect.resizeTarget.parent ? rect.resizeTarget.parent.width:Screen.desktopAvailableWidth
            var availableHeight = rect.resizeTarget.parent ? rect.resizeTarget.parent.height : Screen.desktopAvailableHeight
            if(rect.resizeTarget.x+xOffset>0 && availableWidth-xOffset>minimumWidth){
                rect.resizeTarget.x = rect.resizeTarget.x+xOffset
                rect.resizeTarget.width = rect.resizeTarget.width-xOffset
            }
            var yOffset = mouse.y-yPosition
            var yHeight = rect.resizeTarget.height+yOffset
            if(yHeight+rect.resizeTarget.y<availableHeight && yHeight>minimumHeight){
                rect.resizeTarget.height = yHeight
            }
        }
    }
 
 
    // 右下角
    MouseArea{
        width: mouseRegion
        height: mouseRegion
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeFDiagCursor
        property int xPosition: 0
        property int yPosition: 0
        onPressed: {
            xPosition = mouse.x
            yPosition = mouse.y
        }
        onPositionChanged: {
            var xOffset = mouse.x-xPosition
            var xWidth = rect.resizeTarget.width+xOffset
            var availableWidth = rect.resizeTarget.parent ? rect.resizeTarget.parent.width:Screen.desktopAvailableWidth
            var availableHeight = rect.resizeTarget.parent ? rect.resizeTarget.parent.height : Screen.desktopAvailableHeight
 
            if(xWidth+rect.resizeTarget.x<availableWidth && xWidth>minimumWidth){
                rect.resizeTarget.width = xWidth
            }
            var yOffset = mouse.y-yPosition
            var yHeight = rect.resizeTarget.height+yOffset
            if(yHeight+rect.resizeTarget.y<availableHeight && yHeight>minimumHeight){
                rect.resizeTarget.height = yHeight
            }
        }
    }
}
