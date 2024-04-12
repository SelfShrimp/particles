import QtQuick
import QtQuick.Particles

Window {
    id: rootWindow
    width: 720
    height: 720
    visible: true
    title: qsTr("Particle")

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#1f1f1f"
        ParticleSystem {
            id: particleSystem
        }

        Emitter {
            id: emitter
            width: 360
            height: 360
            x: positionX.sliderValue
            y: positionY.sliderValue
            system: particleSystem
            emitRate: emitRate.sliderValue
            lifeSpan: lifeSpan.sliderValue
            lifeSpanVariation: 500
            size: scale.sliderValue
            sizeVariation: 16
            maximumEmitted: maxCountEmitted.sliderValue
            velocity: AngleDirection {
                angle: -90
                angleVariation: 30
                magnitude: magnitude.sliderValue
            }
        }

        ImageParticle {
            source: "assets/particle.png"
            system: particleSystem
            rotation: rotate.sliderValue
            rotationVelocity: rotateVelocity.sliderValue
        }
    }

    SettingsView {
        CustomLabel {
            text: "Life Span"
        }
        CustomSlider {
            id: lifeSpan
            sliderValue: 1000
            fromValue: 0
            toValue: 3000
        }

        CustomLabel {
            text: "Emit Rate"
        }
        CustomSlider {
            id: emitRate
            sliderValue: 10
            fromValue: 0
            toValue: 50
        }

        CustomLabel {
            text: "Size"
        }
        CustomSlider {
            id: scale
            sliderValue: 32
            fromValue: 1
            toValue: 64
        }

        CustomLabel {
            text: "Rotate"
        }
        CustomSlider {
            id: rotate
            sliderValue: 0
            fromValue: 0
            toValue: 360
        }

        // TODO: it is necessary to fix the reduction
        CustomLabel {
            text: "Maximum count"
        }
        CustomSlider {
            id: maxCountEmitted
            sliderValue: 1
            fromValue: 1
            toValue: 100
            sliderStepSize: 1
        }

        CustomLabel {
            text: "X"
        }
        CustomSlider {
            id: positionX
            sliderValue: 180
            fromValue: 0
            toValue: 360
            sliderStepSize: 1
        }

        CustomLabel {
            text: "Y"
        }
        CustomSlider {
            id: positionY
            sliderValue: 180
            fromValue: 0
            toValue: 360
            sliderStepSize: 1
        }

        CustomLabel {
            text: "Velocity"
        }
        CustomSlider {
            id: magnitude
            sliderValue: 0
            fromValue: 0
            toValue: 500
            sliderStepSize: 1
        }

        CustomLabel {
            text: "Rotate Velocity"
        }
        CustomSlider {
            id: rotateVelocity
            sliderValue: 0
            fromValue: 0
            toValue: 500
            sliderStepSize: 1
        }
    }
}
