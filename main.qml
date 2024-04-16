import QtQuick
import QtQuick.Particles
import QtQuick.Controls
import QtQuick.Dialogs


ApplicationWindow
{
    id: rootWindow
    width: 720
    height: 720
    visible: true
    title: qsTr("Particle")

    menuBar: MenuBar
    {
        Menu
        {
            title: qsTr("&File")

            /*
             Preferences > Environment > System > Change in Environment. Add:
                QML_XHR_ALLOW_FILE_WRITE=1
                QML_XHR_ALLOW_FILE_READ=1
            */
            Action
            {
                text: qsTr("&Open")
                onTriggered:
                {
                    var fileName = "settings.json";
                    var xhr = new XMLHttpRequest;
                    xhr.open("GET", "file:///" + applicationDirPath + "/settings.json", false);

                    xhr.onreadystatechange = function()
                    {
                        if (xhr.readyState === XMLHttpRequest.DONE){
                            var settings = JSON.parse(xhr.responseText);

                            positionX.sliderValue = settings.X;
                            positionY.sliderValue = settings.Y;
                            emitRate.sliderValue = settings.emitRate;
                            lifeSpan.sliderValue = settings.lifeSpan;
                            scale.sliderValue = settings.size;
                            maxCountEmitted.sliderValue = settings.maximumEmitted;
                            magnitude.sliderValue = settings.magnitude;
                            rotate.sliderValue = settings.rotation;
                            rotateVelocity.sliderValue = settings.rotationVelocity;
                        }
                    };
                    xhr.send();
                }
            }

            Action
            {
                text: qsTr("&Save")
                onTriggered:
                {
                    var settings = {
                        "X": positionX.sliderValue,
                        "Y": positionY.sliderValue,
                        "emitRate": emitRate.sliderValue,
                        "lifeSpan": lifeSpan.sliderValue,
                        "size": scale.sliderValue,
                        "maximumEmitted": maxCountEmitted.sliderValue,
                        "magnitude": magnitude.sliderValue,
                        "rotation": rotate.sliderValue,
                        "rotationVelocity": rotateVelocity.sliderValue,
                    };

                    var request = new XMLHttpRequest();
                    request.open("PUT", "file:///" + applicationDirPath + "/settings.json");
                    request.send(JSON.stringify(settings));
                }
            }

        }


    }

    Rectangle
    {
        id: root
        anchors.fill: parent
        color: "#1f1f1f"
        ParticleSystem
        {
            id: particleSystem
        }

        Emitter
        {
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
            velocity: AngleDirection
            {
                angle: -90
                angleVariation: 30
                magnitude: magnitude.sliderValue
            }
        }

        ImageParticle
        {
            source: "assets/particle.png"
            system: particleSystem
            rotation: rotate.sliderValue
            rotationVelocity: rotateVelocity.sliderValue
        }
    }

    SettingsView
    {
        CustomLabel
        {
            text: "Life Span"
        }
        CustomSlider
        {
            id: lifeSpan
            sliderValue: 1000
            fromValue: 0
            toValue: 3000
        }

        CustomLabel
        {
            text: "Emit Rate"
        }
        CustomSlider
        {
            id: emitRate
            sliderValue: 10
            fromValue: 0
            toValue: 50
        }

        CustomLabel
        {
            text: "Size"
        }
        CustomSlider
        {
            id: scale
            sliderValue: 32
            fromValue: 1
            toValue: 64
        }

        CustomLabel
        {
            text: "Rotate"
        }
        CustomSlider
        {
            id: rotate
            sliderValue: 0
            fromValue: 0
            toValue: 360
        }

        // TODO: it is necessary to fix the reduction
        CustomLabel
        {
            text: "Maximum count"
        }
        CustomSlider
        {
            id: maxCountEmitted
            sliderValue: 1
            fromValue: 1
            toValue: 100
            sliderStepSize: 1
        }

        CustomLabel
        {
            text: "X"
        }
        CustomSlider
        {
            id: positionX
            sliderValue: 180
            fromValue: 0
            toValue: 360
            sliderStepSize: 1
        }

        CustomLabel
        {
            text: "Y"
        }
        CustomSlider
        {
            id: positionY
            sliderValue: 180
            fromValue: 0
            toValue: 360
            sliderStepSize: 1
        }

        CustomLabel
        {
            text: "Velocity"
        }
        CustomSlider
        {
            id: magnitude
            sliderValue: 0
            fromValue: 0
            toValue: 500
            sliderStepSize: 1
        }

        CustomLabel
        {
            text: "Rotate Velocity"
        }
        CustomSlider
        {
            id: rotateVelocity
            sliderValue: 0
            fromValue: 0
            toValue: 500
            sliderStepSize: 1
        }
    }
}
