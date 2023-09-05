import QtQuick 2.0

Window {
    id: box;
    width: 700;
    height: 400;
    visible: true;

    Rectangle {
        border.color: Qt.rgba(0, 135/255, 135/255, 1);
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
            drag.maximumX: box.width - blueSquare.width;
            drag.maximumY: box.height - blueSquare.height;
        }

        ResizeRectangle {
            resizeTarget: blueSquare;
        }
    }
}
