import QtQuick
import QtQuick.Controls

Item {
    id: rootItem
    property real showState: AppSettings.showSettingsView ? 1.0 : 0.0

    default property alias content: settingsArea.children

    width: settingsDrawer.width
    height: settingsDrawer.height

    Drawer {
        id: settingsDrawer
        modal: false
        edge: Qt.RightEdge
        interactive: false
        leftInset: -10
        topInset: -20
        bottomInset: -20
        topMargin: 10
        visible: true

        background: Rectangle {
            color: "#80404040"
            border.color: "#000000"
            border.width: 1
            opacity: 0.8
        }

        Column {
            id: settingsArea
        }
        enter: Transition {
            NumberAnimation {
                property: "position"
                to: 1.0
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "position"
                to: 0.0
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
}
