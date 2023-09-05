cmake_minimum_required(VERSION 3.16)

project(HolyWatermarkRemover VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appHolyWatermarkRemover
    main.cpp app.qrc
)

set(resource_files
            res/icons/holy.svg
            res/icons/holy.ico
            res/icons/deleteall.svg
            res/icons/triangle.svg
            res/icons/square.svg
            res/icons/eraser.png
            res/icons/plus.svg
            res/icons/play.svg
            res/icons/delete.svg
            res/icons/addition.svg
            res/images/background.jpg
            res/images/mainui.jpg
        res/icons/question.svg)

qt_add_qml_module(appHolyWatermarkRemover
    URI HolyWatermarkRemover
    VERSION 1.0
    QML_FILES res/qml/EditorMain.qml
              res/qml/EditorView.qml
              res/qml/VideoOutput.qml res/qml/EditorViewV2.qml
              res/qml/MainView.qml
              res/qml/HistoryView.qml
              res/qml/FlatButton.qml
              res/qml/FlatIconButton.qml
              res/qml/WelcomePage.qml
              res/qml/WatermarkScene.qml
              res/qml/EditVideoPage.qml
              res/qml/EditImagePage.qml
              res/qml/Theme.qml
              res/qml/TransparentWelcomePage.qml
              res/qml/HistoryPage.qml
              res/qml/AreaSelectPage.qml
              res/qml/AreaModel.qml
              res/qml/ContactPage.qml
              res/qml/ImExportPage.qml
              res/qml/IconButton.qml
              res/qml/RectangleArea.qml
              res/qml/ResizeRectangle.qml


    RESOURCES ${resource_files}
)

set_target_properties(appHolyWatermarkRemover PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHolyWatermarkRemover
    PRIVATE Qt6::Quick
)

install(TARGETS appHolyWatermarkRemover
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
