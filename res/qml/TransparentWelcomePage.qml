import QtQuick 2.15
import Qt5Compat.GraphicalEffects

Rectangle {
  id: root
  width: 300
  height: 100
  radius: 10 // 圆角半径
  gradient: Gradient { // 渐变效果
    GradientStop { position: 0.0; color: Qt.rgba(47/256, 36/256, 38/256, 1) }
    GradientStop { position: 0.33; color: Qt.rgba(33/256, 33/256, 41/256, 1) }
    GradientStop { position: 1.0; color: Qt.rgba(52/256, 47/256, 99/256, 1) }
  }
  layer.enabled: true // 启用图层效果
  layer.effect: DropShadow { // 阴影效果
    color: Qt.blue
    radius: 5
    samples: 16
    horizontalOffset: 3
    verticalOffset: 3
  }

  Row { // 水平排列图标和文字
    anchors.centerIn: parent // 居中对齐
    spacing: 10 // 图标和文字之间的间距
    Image { // 图标1
      source: "../icons/triangle.svg"
      width: 32
      height: 32
      fillMode: Image.PreserveAspectFit // 按比例缩放图像以适应大小
    }
    Image { // 图标2
      source: "../icons/square.svg"
      width: 32
      height: 32
      fillMode: Image.PreserveAspectFit // 按比例缩放图像以适应大小
    }
    Text { // 文字
      text: "点击查看视频/作品详情页"
      font.pixelSize: 16 // 字体大小
      color: "white" // 字体颜色
    }
  }
}
