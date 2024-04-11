import QtQuick 2.15
import QtQuick.Particles 2.15

Window {
    id: rootWindow
    width: 360
    height: 360
    visible: true
    title: qsTr("Particle")

    Rectangle {
        id: root
        width: 360
        height: 360
        color: "#1f1f1f"

        ParticleSystem {
            id: particleSystem
        }

        Emitter {
            id: emitter
            anchors.centerIn: parent
            width: 240
            height: 240
            system: particleSystem
            emitRate: 40
            lifeSpan: 1000
            lifeSpanVariation: 500
            size: 32
            sizeVariation: 16
        }

        ImageParticle {
            source: "assets/particle.png"
            system: particleSystem
        }
    }
}
