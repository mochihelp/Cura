// Copyright (c) 2018 Ultimaker B.V.
// Toolbox is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Dialogs 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import UM 1.1 as UM

Item
{
    id: sidebar
    height: parent.height
    width: UM.Theme.getSize("base_unit").width * 6
    anchors
    {
        top: parent.top
        left: parent.left
        topMargin: UM.Theme.getSize("double_margin").height
        leftMargin: UM.Theme.getSize("default_margin").width
        rightMargin: UM.Theme.getSize("default_margin").width
    }
    Button
    {
        id: button
        text: "Back"
        UM.RecolorImage
        {
            id: backArrow
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.rightMargin: UM.Theme.getSize("default_margin").width
            width: UM.Theme.getSize("standard_arrow").width
            height: UM.Theme.getSize("standard_arrow").height
            sourceSize.width: width
            sourceSize.height: height
            color: button.hovered ? UM.Theme.getColor("primary") : UM.Theme.getColor("text")
            source: UM.Theme.getIcon("arrow_left")
        }
        width: UM.Theme.getSize("base_unit").width * 4
        height: UM.Theme.getSize("base_unit").height * 2
        onClicked:
        {
            toolbox.viewPage = "overview"
            toolbox.filterPackages("type", toolbox.viewCategory)
            toolbox.filterAuthors("type", toolbox.viewCategory)
        }
        style: ButtonStyle
        {
            background: Rectangle
            {
                color: "transparent"
            }
            label: Label
            {
                id: labelStyle
                text: control.text
                color: control.hovered ? UM.Theme.getColor("primary") : UM.Theme.getColor("text")
                font: UM.Theme.getFont("default_bold")
                horizontalAlignment: Text.AlignRight
                width: control.width
            }
        }
    }
}