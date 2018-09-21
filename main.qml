import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2

ApplicationWindow {
    id: clock
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Footsteps")

    property int hours
    property int minutes
    property real seconds

    property real angHr
    property real angMin
    property real angSec

    property real p1: height / 3 + 20
    property real p2: p1 + 20
    property real p3: p2 + 20
    property real p4: p3 + 20


    function timeChanged() {
        var date = new Date
        hours = date.getHours()
        minutes = date.getMinutes()
        seconds = date.getSeconds() + date.getMilliseconds() / 1000.0
        angHr = (hours * 30) + (minutes * 0.5) - 90
        angMin = minutes * 6                   - 90
        angSec = seconds * 6                   - 90
    }

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered:
        {
            clock.timeChanged()
            clockhands.requestPaint()
        }
    }

    Canvas {
        id: clockhands
        z: 1
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            var centreX = width / 2
            var centreY = height / 2

            ctx.beginPath()
            ctx.moveTo(centreX + p3*Math.cos((angMin-0)*Math.PI/180),
                       centreY + p3*Math.sin((angMin-0)*Math.PI/180))
            ctx.lineTo(centreX + p4*Math.cos((angMin-0)*Math.PI/180),
                       centreY + p4*Math.sin((angMin-0)*Math.PI/180))
            ctx.lineTo(centreX + p4*Math.cos((angMin-8)*Math.PI/180),
                       centreY + p4*Math.sin((angMin-8)*Math.PI/180))
            ctx.lineTo(centreX + p3*Math.cos((angMin-8)*Math.PI/180),
                       centreY + p3*Math.sin((angMin-8)*Math.PI/180))
            ctx.lineTo(centreX + p3*Math.cos((angMin-0)*Math.PI/180),
                       centreY + p3*Math.sin((angMin-0)*Math.PI/180))
            ctx.fillStyle = "red"
            ctx.closePath()
            ctx.stroke()
            ctx.fill()

            ctx.beginPath()
            ctx.moveTo(centreX + p1*Math.cos((angHr-0)*Math.PI/180),
                       centreY + p1*Math.sin((angHr-0)*Math.PI/180))
            ctx.lineTo(centreX + p2*Math.cos((angHr-0)*Math.PI/180),
                       centreY + p2*Math.sin((angHr-0)*Math.PI/180))
            ctx.lineTo(centreX + p2*Math.cos((angHr-8)*Math.PI/180),
                       centreY + p2*Math.sin((angHr-8)*Math.PI/180))
            ctx.lineTo(centreX + p1*Math.cos((angHr-8)*Math.PI/180),
                       centreY + p1*Math.sin((angHr-8)*Math.PI/180))
            ctx.lineTo(centreX + p1*Math.cos((angHr-0)*Math.PI/180),
                       centreY + p1*Math.sin((angHr-0)*Math.PI/180))
            ctx.fillStyle = "green"
            ctx.closePath()
            ctx.stroke()
            ctx.fill()

            ctx.beginPath()
            ctx.moveTo(centreX + p1*Math.cos((angSec-15)*Math.PI/180),
                       centreY + p1*Math.sin((angSec-15)*Math.PI/180))
            ctx.lineTo(centreX + p2*Math.cos((angSec-15)*Math.PI/180),
                       centreY + p2*Math.sin((angSec-15)*Math.PI/180))
            ctx.lineTo(centreX + p2*Math.cos((angSec-23)*Math.PI/180),
                       centreY + p2*Math.sin((angSec-23)*Math.PI/180))
            ctx.lineTo(centreX + p1*Math.cos((angSec-23)*Math.PI/180),
                       centreY + p1*Math.sin((angSec-23)*Math.PI/180))
            ctx.lineTo(centreX + p1*Math.cos((angSec-15)*Math.PI/180),
                       centreY + p1*Math.sin((angSec-15)*Math.PI/180))
            ctx.fillStyle = "blue"
            ctx.closePath()
            ctx.stroke()
            ctx.fill()

            ctx.beginPath()
            ctx.moveTo(centreX + p3*Math.cos((angSec-15)*Math.PI/180),
                       centreY + p3*Math.sin((angSec-15)*Math.PI/180))
            ctx.lineTo(centreX + p4*Math.cos((angSec-15)*Math.PI/180),
                       centreY + p4*Math.sin((angSec-15)*Math.PI/180))
            ctx.lineTo(centreX + p4*Math.cos((angSec-23)*Math.PI/180),
                       centreY + p4*Math.sin((angSec-23)*Math.PI/180))
            ctx.lineTo(centreX + p3*Math.cos((angSec-23)*Math.PI/180),
                       centreY + p3*Math.sin((angSec-23)*Math.PI/180))
            ctx.lineTo(centreX + p3*Math.cos((angSec-15)*Math.PI/180),
                       centreY + p3*Math.sin((angSec-15)*Math.PI/180))
            ctx.fillStyle = "blue"
            ctx.closePath()
            ctx.stroke()
            ctx.fill()


            ctx.beginPath()
            ctx.moveTo(centreX + p1*Math.cos(angSec*Math.PI/180),
                       centreY + p1*Math.sin(angSec*Math.PI/180))
            ctx.lineTo(centreX + p2*Math.cos(angSec*Math.PI/180),
                       centreY + p2*Math.sin(angSec*Math.PI/180))
            ctx.lineTo(centreX + p2*Math.cos((angSec-8)*Math.PI/180),
                       centreY + p2*Math.sin((angSec-8)*Math.PI/180))
            ctx.lineTo(centreX + p1*Math.cos((angSec-8)*Math.PI/180),
                       centreY + p1*Math.sin((angSec-8)*Math.PI/180))
            ctx.lineTo(centreX + p1*Math.cos(angSec*Math.PI/180),
                       centreY + p1*Math.sin(angSec*Math.PI/180))
            ctx.fillStyle = "blue"
            ctx.closePath()
            ctx.stroke()
            ctx.fill()

            ctx.beginPath()
            ctx.moveTo(centreX + p3*Math.cos((angSec-0)*Math.PI/180),
                       centreY + p3*Math.sin((angSec-0)*Math.PI/180))
            ctx.lineTo(centreX + p4*Math.cos((angSec-0)*Math.PI/180),
                       centreY + p4*Math.sin((angSec-0)*Math.PI/180))
            ctx.lineTo(centreX + p4*Math.cos((angSec-8)*Math.PI/180),
                       centreY + p4*Math.sin((angSec-8)*Math.PI/180))
            ctx.lineTo(centreX + p3*Math.cos((angSec-8)*Math.PI/180),
                       centreY + p3*Math.sin((angSec-8)*Math.PI/180))
            ctx.lineTo(centreX + p3*Math.cos((angSec-0)*Math.PI/180),
                       centreY + p3*Math.sin((angSec-0)*Math.PI/180))
            ctx.fillStyle = "blue"
            ctx.closePath()
            ctx.stroke()
            ctx.fill()

        }
    }

    Canvas {
        id: canvasParent
            anchors.fill: clockhands
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()

                var centreX = width / 2
                var centreY = height / 2
                var ang = 1
                ctx.beginPath()
                ctx.moveTo(0,0)
                ctx.lineTo(width,0)
                ctx.lineTo(width,height)
                ctx.lineTo(0, height)
                ctx.lineTo(0,0)
                ctx.fillStyle = "#aaaaaa"
                ctx.fill()
                ctx.closePath()
                for (var i = 0; i < 360/ang; i += 1)
                {
                    ctx.beginPath()
                    if (i%2 == 1)
                    {
                        ctx.fillStyle = "black"
                    }
                    else
                    {
                        ctx.fillStyle = "#cccccc"
                    }

                    ctx.moveTo(centreX, centreY)
                    ctx.arc(centreX, centreY, height/2, i*ang*Math.PI/180, (i+1)*ang*Math.PI/180, false)
                    ctx.fill()
                }
                ctx.closePath()

                ctx.beginPath()
                ctx.arc(centreX, centreY, height/4, 0, 2*Math.PI, false)
                ctx.fillStyle = "black"
                ctx.fill()
            }
        }

}
