// Copyright (c) 2015 Ultimaker B.V.
// Uranium is released under the terms of the AGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

import UM 1.0 as UM

Button {
    id: base;

    property variant color;

    style: UM.Theme.styles.sidebar_category;

    MouseArea {
        id: settingsButton

        visible: base.hovered || settingsButton.hovered
        height: base.height * 0.6
        width: base.height * 0.6

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: UM.Theme.getSize("setting_preferences_button_margin").width

        UM.RecolorImage {
            anchors.fill: parent;

            sourceSize.width: width
            sourceSize.height: width

            color: parent.containsMouse ? UM.Theme.getColor("setting_control_button_hover") : UM.Theme.getColor("setting_control_button");
            source: UM.Theme.getIcon("settings");
        }

        onClicked: {
            preferences.visible = true;
            preferences.setPage(2);
            preferences.getCurrentItem().scrollToSection(model.id);
        }
    }
}

