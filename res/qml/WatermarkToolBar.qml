import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {

    implicitWidth: 255;
    implicitHeight: 500;
    radius: 10;
    color: Qt.rgba(32/255, 32/255, 40/255, 1)
    id: idOperatorSelect;
    visible: true;

    Label {
        text: qsTr("id_operator_title");
        id: id_operator_title;
        color: "white";
        font.pixelSize: 15;
        anchors.top: parent.top
        anchors.topMargin: 20;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
    }

    Row{
        spacing: 3;
        anchors.top: id_operator_title.bottom;
        anchors.topMargin: 20;
        anchors.left: parent.left;
        anchors.leftMargin: 20;

        DynamicIconButton{
            id: idDrawPen;
            width: 50;
            height: 50;
            iconWidth: 30;
            iconHeight: 30;
            radius: 10;
            hoveredMsg: qsTr("tx_draw_pen")
            iconSource: "../icons/ic_draw_pen.svg"
            onClicked:{
                console.log("==>> pen");

                idDrawPen.color = Qt.rgba(118/255, 107/255, 196/255, 1);
                idMultiLine.color = Qt.rgba(46/255, 46/255, 56/255, 1);
                idRectSelect.color = Qt.rgba(46/255, 46/255, 56/255, 1);
            }
        }

        DynamicIconButton{
            id: idRectSelect;
            width: 50;
            height: 50;
            iconWidth: 30;
            iconHeight: 30;
            radius: 10;
            hoveredMsg: qsTr("tx_rectangle")
            iconSource: "../icons/ic_rect_select.svg"
            onClicked:{
                console.log("==>> rect");
                idRectSelect.color = Qt.rgba(118/255, 107/255, 196/255, 1);
                idMultiLine.color = Qt.rgba(46/255, 46/255, 56/255, 1);
                idDrawPen.color = Qt.rgba(46/255, 46/255, 56/255, 1);
            }
        }

        DynamicIconButton{
            id: idMultiLine;
            width: 50;
            height: 50;
            iconWidth: 30;
            iconHeight: 30;
            radius: 10;
            hoveredMsg: qsTr("tx_multi_rect_line")
            iconSource: "../icons/ic_multi_rect_line.svg"
            onClicked:{
                console.log("==>> line");
                idMultiLine.color = Qt.rgba(118/255, 107/255, 196/255, 1);
                idDrawPen.color = Qt.rgba(46/255, 46/255, 56/255, 1);
                idRectSelect.color = Qt.rgba(46/255, 46/255, 56/255, 1);
            }
        }
    }
}
