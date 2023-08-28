import QtQuick 2.11
import QtQuick.Window 2.0
//import QtGraphicalEffects   // qt5
import QtQuick.Shapes 1.15  // qt6

Rectangle {
    visible: true;
    width: 500;
    height: 270;
    id: welcPage;
    radius: 10;

    opacity: 0.8;

    color: Qt.rgba(33/255, 33/255, 43/255, 1);

//    gradient: Gradient {
//        GradientStop { position: 0.0; color: "#32176b" }
//        GradientStop { position: 0.5; color: "#318bad"; }
//        GradientStop { position: 1.0; color: "#32cad0" }
//    }

    MouseArea {
        anchors.fill: parent;
        hoverEnabled: true;
        onEntered: {
//            console.log("==>> is entered");
            welcPage.color = theme.puzzleColor;
            anim.to = 180;
            anim.start();
        }

        onExited: {
//            console.log("==>> is exited")
            welcPage.color = theme.wellColor;
            anim.to = 0;
            anim.start();
        }
    }

    Rectangle {
        anchors.top: parent.top;
        anchors.topMargin: 5;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 5;

        anchors.left: parent.left;
        anchors.leftMargin: 5;
        anchors.right: parent.right;
        anchors.rightMargin: 5;

        radius: 10;

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#32cad0" }
            GradientStop { position: 0.33; color: "#318bad" }
            GradientStop { position: 1.0; color: "#32176b" }
        }
    }


    Image {
        id: welcomeEarth;
        width: 100;
        height: 60;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 50;
        source: "../icons/eraser.png";
        fillMode: Image.PreserveAspectFit;
    }

    Text {
        id: methodTitle;
        text: qsTr("click and drag file to here!");
        anchors.top: welcomeEarth.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: parent.horizontalCenter;
        font.bold: true;
        font.pixelSize: 24;
        wrapMode: Text.WordWrap;
    }

    Text {
        text: qsTr("support video and image");
        anchors.top: methodTitle.bottom;
        anchors.topMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
    }

    NumberAnimation {
        id: anim;
        target: welcomeEarth;
        property: "rotation";
        duration: 200;
        loops: 1;
    }
}
