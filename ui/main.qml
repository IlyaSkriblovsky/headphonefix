import Qt 4.7
import QtMobility.feedback 1.1
import com.meego 1.0
import com.meego.extras 1.0

import QtProcess 0.1


PageStackWindow {


    initialPage: Page {

        Process {
            id: switcher

            program: "/opt/headphonefix/switcher"

            function doSwitch(arg) {
                this.arguments = [ arg ]
                this.start()
            }

            // onFinished: console.log('finished')
            // onStarted: console.log('started')

            // onReadyReadStandardOutput: console.log("out: " + readAllStandardOutput())
            // onReadyReadStandardError: console.log("err: " + readAllStandardError())
        }


        Label {
            id: label

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10

            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlighHCenter

            text: qsTr("1. Insert or eject cable\n2. Click one of buttons below to change mode")
        }


        HapticsEffect {
            id: effect

            attackTime: 1000
            attackIntensity: 0

            period: 1000

            fadeTime: 1000
            fadeIntensity: 0
        }


        Item {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: label.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 20

            property int margin: 5

            Button {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.right: parent.horizontalCenter
                anchors.bottom: parent.verticalCenter
                anchors.margins: parent.margin
                text: qsTr("Speaker")

                platformStyle: ButtonStyle { fontPixelSize: 32 }

                onClicked: {
                    effect.start()
                    banner.display("Activating Speaker")
                    switcher.doSwitch("speaker")
                }
            }

            Button {
                anchors.left: parent.horizontalCenter
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.verticalCenter
                anchors.margins: parent.margin
                text: qsTr("Video out")

                platformStyle: ButtonStyle { fontPixelSize: 32 }

                onClicked: {
                    effect.start()
                    banner.display("Activating VideoOut")
                    switcher.doSwitch("videoout")
                }
            }

            Button {
                anchors.left: parent.left
                anchors.top: parent.verticalCenter
                anchors.right: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.margins: parent.margin
                text: qsTr("Headset\nwith mic")

                platformStyle: ButtonStyle { fontPixelSize: 32 }

                onClicked: {
                    effect.start()
                    banner.display("Activating Headset with Mic")
                    switcher.doSwitch("headset")
                }
            }

            Button {
                anchors.left: parent.horizontalCenter
                anchors.top: parent.verticalCenter
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: parent.margin
                text: qsTr("Headset\nwithout mic")

                platformStyle: ButtonStyle { fontPixelSize: 32 }

                onClicked: {
                    effect.start()
                    banner.display("Activating Headset without Mic")
                    switcher.doSwitch("headphone")
                }
            }

        }
        InfoBanner {
            id: banner

            function display(text) {
                this.text = text
                this.show()
            }
        }


    }
}
