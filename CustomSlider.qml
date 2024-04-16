import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item
{
    id: rootItem
    property alias sliderValue: slider.value
    property alias fromValue: slider.from
    property alias toValue: slider.to
    property alias sliderEnabled: slider.enabled
    property alias sliderStepSize: slider.stepSize
    readonly property bool highlight: slider.hovered || slider.pressed

    width: 260
    height: rowLayout.height

    RowLayout
    {
        id: rowLayout
        width: parent.width
        Slider
        {
            id: slider
            stepSize: 0.01
            Layout.minimumWidth: 200
            Layout.fillWidth: true
        }
        Label
        {
            id: valueText
            text: slider.value.toFixed(2)
            color: "#f0f0f0"
            font.pointSize: 10
            font.bold: true
            Layout.minimumWidth: 60
        }
    }
}
