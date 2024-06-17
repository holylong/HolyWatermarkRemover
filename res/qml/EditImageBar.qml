import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
   height: 98;
   implicitWidth: 400;
   color: Qt.rgba(32/255,32/255,32/255,1);
   radius: 5;

   Rectangle {
     id: backForwardLayout
     height: 50;
     width: 200;
     color: Qt.rgba(32/255,32/255,32/255,1);
     anchors.verticalCenter: parent.verticalCenter;
     anchors.left: parent.left;
     anchors.leftMargin: 50;
     Row {
         spacing: 5;
         DynamicIconButton {
             iconSource: "../icons/ic_back_bold.svg"
             hoveredMsg: qsTr("tx_back_up");
             width: 40;
             height: 40;
             iconWidth: 25;
             iconHeight: 25;
         }
         DynamicIconButton {
             iconSource: "../icons/ic_forward_bold.svg"
             hoveredMsg: qsTr("tx_forward_up");
             width: 40;
             height: 40;
             iconWidth: 25;
             iconHeight: 25;
         }
         DynamicIconButton {
             iconSource: "../icons/ic_reset.svg"
             hoveredMsg: qsTr("tx_reset");
             width: 40;
             height: 40;
             iconWidth: 25;
             iconHeight: 25;
         }
     }
   }

   Rectangle {
       id: imageOperateLayout
       anchors.left: backForwardLayout.right;
       anchors.leftMargin: 50;
       height: 50;
       width: 200;
       color: Qt.rgba(32/255,32/255,32/255,1);
       anchors.verticalCenter: parent.verticalCenter;
        Row {
            spacing: 5;
            DynamicIconButton {
                iconSource: "../icons/ic_larger_bold.svg"
                hoveredMsg: qsTr("tx_larger");
                width: 40;
                height: 40;
                iconWidth: 25;
                iconHeight: 25;
            }
            DynamicIconButton {
                iconSource: "../icons/ic_smaller_bold.svg"
                hoveredMsg: qsTr("tx_smaller");
                width: 40;
                height: 40;
                iconWidth: 25;
                iconHeight: 25;
            }
            DynamicIconButton {
                iconSource: "../icons/ic_move_with_hand.svg"
                hoveredMsg: qsTr("tx_move_with_hand");
                width: 40;
                height: 40;
                iconWidth: 25;
                iconHeight: 25;
            }
            DynamicIconButton {
                iconSource: "../icons/ic_adapt_size.svg"
                hoveredMsg: qsTr("tx_adapt_size");
                width: 40;
                height: 40;
                iconWidth: 25;
                iconHeight: 25;
            }
            DynamicIconButton {
                iconSource: "../icons/ic_compare.svg"
                hoveredMsg: qsTr("tx_compare");
                width: 40;
                height: 40;
                iconWidth: 25;
                iconHeight: 25;
            }
        }
   }

   Rectangle {
       id: previewLayout
       anchors.right: parent.right;
       anchors.rightMargin: 50;
       radius: 10;
       color: Qt.rgba(32/255, 32/255, 40/255, 1)
       height: 30;
       width: 60;
       anchors.verticalCenter: parent.verticalCenter;
       Button {
            text: qsTr("tx_preview");

            width: 60;
            height: 30;
       }
   }
}
