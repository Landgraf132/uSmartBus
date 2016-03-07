import QtQuick 2.4

import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem
import "Main.js" as Main

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "MainMenu"



    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */



    headerColor: "#996BC1"

   // width: units.gu(80)
    width: mainview.width
    height: mainview.height
    Page {
        title: "Главное меню"


        ListModel {
            id:menuModel
            ListElement {


                textString: "Выбрать остановку"
                name: "find.svg"
            }
            ListElement {
                textString: "Избранные остановки"
                name: "scope-manager.svg"
            }
            ListElement {
                textString: "Последние 10 остановок"
                name: "view-list-symbolic.svg"
            }
            ListElement {
                textString: "Изменить город"
                name: "home.svg"
            }
        }
        Rectangle{
            width: units.gu(37); height: units.gu(37)
            border.color: "#D4D4D4"
            radius: 10

 anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin:units.gu(6)
            GridView {
                width: units.gu(34); height: units.gu(34)
                cellWidth: units.gu(17); cellHeight: units.gu(17)
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                model:menuModel
                delegate:Button{
                    width: units.gu(16)
                    height: units.gu(16)
                    iconPosition: "center"
                    color:"#FFFFFF"
                    onClicked: {

                        switch (textString) {
                           case "Выбрать остановку":
                               pageStack.push(Qt.resolvedUrl("SelectStation.qml"))
                              break
                           case "Избранные остановки":
                              textString="dont work";
                              break

                           case "Последние 10 остановок":
                             pageStack.push(Qt.resolvedUrl("SelectOfTop10Station.qml"))

                               console.log("omg");
                              break
                           case "Изменить город":
                              Main.saveSetting("firstLaunch","yes");
                               pageStack.push(Qt.resolvedUrl("SelectCity.qml"))
                              break
                        }

                    }

                    Image { source: name; anchors.horizontalCenter: parent.horizontalCenter ;anchors.verticalCenter: parent.verticalCenter ;width: units.gu(8);height: units.gu(8);}
                    Text { text: textString; width:120; anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter;wrapMode:Text.WordWrap; anchors.leftMargin:2; verticalAlignment:Text.AlignHCenter}
                }
            }
        }
    }
}

