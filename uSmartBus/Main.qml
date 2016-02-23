import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0




import "Main.js" as Main
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "usmartbus.landgraf"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.

 //headerColor: "#996BC1"

    width: units.gu(80)
    height: units.gu(100)

 property var db: null
     property int firstLaunch: 1
 /*    Loader {
            id: background

            anchors.fill: parent
            source: "SelectStation.qml"
        }
        */







    PageStack {
        id: pageStack
        Component.onCompleted: { if (Main.launchApp()!==0) push(Qt.resolvedUrl("SelectCity.qml"), { property: "value" }); else push(Qt.resolvedUrl("MainMenu.qml"), { property: "value" });}



    }

}
