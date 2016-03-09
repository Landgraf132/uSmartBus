import QtQuick 2.4

import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

import "Main.js" as Main

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "MainMenu"



    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */



    headerColor: "#EEF2F5"

   // width: units.gu(80)
    width: mainview.width
    height: mainview.height
    Page {

        header: PageHeader {
        id:pageHeader



        title:  "Главное меню";

                            StyleHints {
                                foregroundColor: "white"
                                backgroundColor: "#996BC1"
                                dividerColor:  "#762572"
                                contentHeight: units.gu(7)
                            }


                }

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
                textString: "Частые остановки"
                name: "view-list-symbolic.svg"
            }
            ListElement {
                textString: "Изменить город"
                name: "home.svg"
            }
        }

Label{
    id:cityNameLabel;
anchors.top:pageHeader.top;
anchors.left:parent.left;
anchors.leftMargin: units.gu(2);
anchors.topMargin: units.gu(9);
 text:Main.getSetting("city_rus");
    fontSize: "x-large";
}
Label{
    id:chooseOption
anchors.top:cityNameLabel.top;
anchors.left:parent.left;
anchors.leftMargin: units.gu(2);
anchors.topMargin: units.gu(9);
 text:"Выберите вариант:";
    fontSize: "large";
}
            GridView {
snapMode:GridView.NoSnap;
            anchors.top:chooseOption.bottom;
            anchors.topMargin: units.gu(5);
            width: parent.width; height: units.gu(34)
                cellWidth: parent.width; cellHeight: units.gu(9)
                 anchors.horizontalCenter: parent.horizontalCenter

                model:menuModel
                delegate:Button{
                          anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width-units.gu(2);
                    height: units.gu(8)
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

                           case "Частые остановки":
                             pageStack.push(Qt.resolvedUrl("SelectOfTop10Station.qml"))

                               console.log("omg");
                              break
                           case "Изменить город":
                              Main.saveSetting("firstLaunch","yes");
                               pageStack.push(Qt.resolvedUrl("SelectCity.qml"))
                              break
                        }

                    }

                    Image { source: name; anchors.left:parent.left ;anchors.verticalCenter: parent.verticalCenter ; anchors.leftMargin:units.gu(1);width: units.gu(4);height: units.gu(4); id:buttonImageText}
                    Text { text: textString; anchors.left:buttonImageText.right ;anchors.leftMargin:units.gu(1); anchors.bottom: parent.bottom; anchors.top:parent.top;anchors.topMargin:units.gu(3);     font.pixelSize:  units.dp(18)}
                }
            }
        }
    }


