import QtQuick 2.12

QtObject {
    property color textColor: "#d1d5db"
    property color textAccent: "#8e8ea0"
    property color mutedTextColor: backgroundLightest
    property color textErrorColor: "red"
    property color backgroundDarkest: "#202123"
    property color backgroundDarker: "#222326"
    property color backgroundDark: "#242528"
    property color backgroundLight: "#343541"
    property color backgroundLighter: "#444654"
    property color backgroundLightest: "#7d7d8e"
    property color backgroundAccent: "#40414f"
    property color buttonBorder: "#565869"
    property color dialogBorder: "#d1d5db"
    property color userColor: "#ec86bf"
    property color assistantColor: "#10a37f"
    property color linkColor: "#55aaff"
    property color tabBorder: "#2c2d35"
    property color whiteColor: "#FFFFFF"
    property color wellColor: Qt.rgba(33/255, 33/255, 43/255, 1)
    property color puzzleColor: Qt.rgba(83/255, 83/255, 101/255, 1)
    property real  fontSizeLarge: Qt.application.font.pixelSize
    property real  fontSizeLarger: Qt.application.font.pixelSize + 2
}
