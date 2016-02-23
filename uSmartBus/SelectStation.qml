import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0 as ListItem

import "Main.js" as Main
MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "SelectStation"



    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */



  headerColor: "#996BC1"

    width: units.gu(80)
    height: units.gu(100)
    Page {
          title: "Выберите остановку"
Column {

    width: units.gu(80)
    height: units.gu(95)
    ActivityIndicator {
        id: activityIndicator
        anchors.centerIn: parent
        running: true
        visible: false
    }
        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }




           TextField {
                  width:units.gu(32); height:units.gu(6);
                 id: stationSearchField
                    placeholderText: "Введите название остановки"
                    onTextChanged: Main.searchStation(stationSearchField.text)
                      font.pixelSize:  units.dp(25)
            }

            Item {
                 id: rootItem
                 // create a model item instance

                 ListModel {

                     id: stationModel


                 }
            }

            UbuntuListView{
 Component.onCompleted: {Main.getAllStation(); Page.title=Main.getSetting("city_rus")}

                width:anchors.width; height:50;




                       delegate:ListItem.Base {


                        width:parent.width;height:units.gu(9);

 onClicked:{

pageStack.push(Qt.resolvedUrl("ShowTimetable.qml"));
  Main.chooseStation(itemStation.text);

 }

                        Text{

                            id:itemStation
                           // color: "#762572"
                            anchors.top:parent.top
                             anchors.topMargin:10
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize:  units.dp(25)
                            text:stationName
                        }
                        Text{
                            id:itemStationDescryption
                            anchors.top:itemStation.top
                             anchors.topMargin:units.gu(5)
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize:  units.dp(15)
                            text:stationDescryption
                        }
                    }

                id:stationListView
                anchors.top:stationSearchField.top
                   anchors.topMargin:units.gu(15);
                anchors.fill:parent
                model:stationModel

                spacing:4

            }

}
   //indicator loading
      /*  states: [
             State {
                 name: stationListView
                 PropertyChanges { target: activityIndicator; visible: false}

             },
             State {
                 name: stationListView._stateLoading
                 PropertyChanges { target: activityIndicator; visible: true}

             }
         ]
         */
}

    }
    }
