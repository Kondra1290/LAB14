// SPDX-FileCopyrightText: 2023 Open Mobile Platform LLC <edu@omp.ru>
// SPDX-License-Identifier: BSD-3-Clause

import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    objectName: "Animations"


    Image {
        id: image
        objectName: "image"
        source: Qt.resolvedUrl("images/aurora.svg")
        fillMode: Image.PreserveAspectFit
        height: parent.height/2
        width: parent.width/2
        y:400
        x:30
        //anchors { fill: parent; rightMargin: parent.height/4.4 }

        MouseArea {
            objectName: "imageMouseArea"
            anchors.fill: parent

            onClicked: {
                moveImageY.running = false
                moveImageX.running = false
                imageAnimation.running = true
            }
        }

        RotationAnimation on rotation {
            id: imageAnimation
            objectName: "imageAnimation"
            to: image.rotation + 360
            duration: 2000
            running: false
        }

        PropertyAnimation on x {
            id: moveImageX
            duration: 1000
            to: 0
            loops: 1
            running: false
        }

        PropertyAnimation on y {
            id: moveImageY
            duration: 1000
            to: 0
            loops: 1
            running: false
        }
    }

    Rectangle {
        id: rectangle
        objectName: "rectangle"
        color: "red"
        anchors { fill: parent; leftMargin: parent.height / 3 }
        states: State {
            name: "blue"
            when: rectangleMouseArea.pressed

            PropertyChanges  { target: rectangle; color: "blue" }
        }
        transitions: [
            Transition {
                to: "blue"

                ColorAnimation { duration: 2000 }
            },
            Transition {
                from: "blue"

                ColorAnimation { duration: 500 }
            }
        ]

        MouseArea {
            id: rectangleMouseArea
            objectName: "rectangleMouseArea"
            anchors.fill: parent
        }
    }



    property int initialHeight: 100
    property int heightChange: 0
    property int initialY: 0
    Rectangle {
        id: rectangle1
        objectName: "rectangle1"
        width: parent.width
        height: 200
        color: "green"
        //anchors { fill: parent; topMargin: parent.height/1.5 }

        PropertyAnimation on height {
            id: moveRect
            duration: 3000
            to: 0
            loops: 1
            running: false
        }

        MouseArea {
            id: rectangleMouseArea1
            objectName: "rectangleMouseArea1"
            anchors.fill: parent

            onPositionChanged: {
                if (mouse.buttons === Qt.LeftButton) {
                    heightChange = mouse.y - initialY
                    rectangle1.height = initialHeight + heightChange
                }
            }
            onPressed: {
                moveRect.running = false
                initialY  = mouse.y
                initialHeight = rectangle1.height
           }
        }
    }

    AnimatedSprite{
        id: sprite1
        width: 140
        height: 80
        source: "images/ducks.png"
        y: rectangle1.y + rectangle1.height-40
        x: 300

        frameCount: 2
        frameHeight: 40
        frameWidth: 70
        frameRate: 5
        //frameSync: true
        frameDuration: 200
        loops: AnimatedSprite.Infinite

        running: moveRect.running
        //visible: moveRect.running
    }

    Button{
        id: task
        x: 0
        y: 1200
        width: 84
        objectName: "button"
        Image {
            id: duckButton
            anchors.fill: parent
            height: 50
            width: 50
            source: Qt.resolvedUrl("images/duck_icon.svg")
            fillMode: Image.PreserveAspectFit
        }
        onClicked: generateAction()
    }
/*
    ListView {
        id: list
        width: 180; height: 200
        model: ListModel
        delegate: Image{
            height: 60
            width: 60
            source: Qt.resolvedUrl("images/duck_legs.png")
            transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
            opacity: 0
            PropertyAnimation {
                target: this
                property: "opacity"
                to: 1
                duration: 2000
                easing.type: Easing.InOutQuad
                running: false
            }
        }

        highlight: highlight
        highlightFollowsCurrentItem: false
        focus: true
    }
    */

    Image{
        id: duckLegs1
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation1
            target: duckLegs1
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs2
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation2
            target: duckLegs2
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }}

    Image{
        id: duckLegs3
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation3
            target: duckLegs3
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs4
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation4
            target: duckLegs4
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs5
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation5
            target: duckLegs5
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs6
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation6
            target: duckLegs6
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs7
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation7
            target: duckLegs7
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs8
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation8
            target: duckLegs8
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs9
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation9
            target: duckLegs9
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs10
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation10
            target: duckLegs10
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs11
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation11
            target: duckLegs11
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs12
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation12
            target: duckLegs12
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }
    Image{
        id: duckLegs13
        height: 60
        width: 60
        source: Qt.resolvedUrl("images/duck_legs.png")
        //fillMode: Image.PreserveAspectFit
        transform: Rotation { origin.x: width/2; origin.y: height/2; axis { x: 0; y: 0; z: 1 } angle: 0}
        opacity: 0
        PropertyAnimation {
            id: opacityAnimation13
            target: duckLegs13
            property: "opacity"
            to: 1
            duration: 2000
            easing.type: Easing.InOutQuad
            running: false
        }
    }

    /*
    Item {
        id: duck_legs
        height: 50
        width: 50

        ListModel {
            id: imageModel
            ListElement { source: "images/duck_legs.png"; x: 0; y: 0; opacity: 0 }
        }

        Repeater {
                model: imageModel
                delegate: Image {
                    width: 100
                    height: 200
                    source: imageModel.source
                    x: model.x
                    y: model.y
                    opacity: model.opacity

                    Behavior on opacity {
                        NumberAnimation { duration: 1000 }
                    }
                }
            }
    }
    */
/*
    Repeater {
        model: imageModel
        delegate:Image {
                //anchors.fill: parent
                source: model.source
                width: 100
                height: 100
                fillMode: Image.PreserveAspectFit

                id: animatedImage
                source: model.source
                width: parent.width
                height: parent.height
                opacity: 0

                SequentialAnimation {
                    running: true
                    PropertyAnimation {
                        target: animatedImage
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 1000
                    }
                }
            }
        }
*/

    property int generatedHeight: 0
    property int generatedAction: 0
    property int moveX: 0
    property int moveY: 0
    property int move: 1
    property int count: 0

    function generateAction() {
        generatedAction = Math.random()*3+1
        //duck_legs.visible = false

        switch(generatedAction){
            case 1:
            {
                moveIcon()
                break
            }
            case 2:
            {
                moveGreen()
                break;
            }
            case 3:
            {
                showDuckLegs()
                break;
            }
            default: break;
        }
    }

    function moveIcon() {
        moveX = Math.random()*400
        moveY = Math.random()*800

        moveImageX.to = moveX
        moveImageY.to = moveY
        moveImageX.running = true
        moveImageY.running = true
    }

    function moveGreen() {
        //animDuck.visible=true
        //spriteAnim.start()
        //spriteAnim.running = true

        generatedHeight = Math.random()*800 + 200;
        moveRect.to = generatedHeight
        moveRect.running = true;

    }

    function showDuckLegs() {
        var posX = Math.random()*250+ rectangle.x
        var posY = Math.random()*1100 + rectangle1.height
        var rot = Math.random()*360
        console.log(posY + " " + posX);
        count++

        switch(count){
            case 1:{
                duckLegs1.x = posX
                duckLegs1.y = posY
                duckLegs1.rotation = rot
                duckLegs1.opacity = 0
                opacityAnimation1.running = true;
                break
            }
            case 2:{
                duckLegs2.x = posX
                duckLegs2.y = posY
                duckLegs2.rotation = rot
                duckLegs2.opacity = 0
                opacityAnimation2.running = true;
                break
            }
            case 3:{
                duckLegs3.x = posX
                duckLegs3.y = posY
                duckLegs3.rotation = rot
                duckLegs3.opacity = 0
                opacityAnimation3.running = true;
                break
            }
            case 5:{
                duckLegs4.x = posX
                duckLegs4.y = posY
                duckLegs4.rotation = rot
                duckLegs4.opacity = 0
                opacityAnimation4.running = true;
                break
            }
            case 6:{
                duckLegs6.x = posX
                duckLegs6.y = posY
                duckLegs6.rotation = rot
                duckLegs6.opacity = 0
                opacityAnimation6.running = true;
                break
            }
            case 7:{
                duckLegs7.x = posX
                duckLegs7.y = posY
                duckLegs7.rotation = rot
                duckLegs7.opacity = 0
                opacityAnimation7.running = true;
                break
            }
            case 8:{
                duckLegs8.x = posX
                duckLegs8.y = posY
                duckLegs8.rotation = rot
                duckLegs8.opacity = 0
                opacityAnimation8.running = true;
                break
            }
            case 9:{
                duckLegs9.x = posX
                duckLegs9.y = posY
                duckLegs9.rotation = rot
                duckLegs9.opacity = 0
                opacityAnimation9.running = true;
                break
            }
            case 10:{
                duckLegs10.x = posX
                duckLegs10.y = posY
                duckLegs10.rotation = rot
                duckLegs10.opacity = 0
                opacityAnimation10.running = true;
                break
            }
            case 11:{
                duckLegs11.x = posX
                duckLegs11.y = posY
                duckLegs11.rotation = rot
                duckLegs11.opacity = 0
                opacityAnimation1.running = true;
                break
            }
            case 12:{
                duckLegs12.x = posX
                duckLegs12.y = posY
                duckLegs12.rotation = rot
                duckLegs12.opacity = 0
                opacityAnimation12.running = true;
                break
            }
            case 13:{
                duckLegs13.x = posX
                duckLegs13.y = posY
                duckLegs13.rotation = rot
                duckLegs13.opacity = 0
                opacityAnimation13.running = true;
                break
            }
        }
    }
}
