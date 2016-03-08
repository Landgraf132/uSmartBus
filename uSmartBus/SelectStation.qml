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



    headerColor: UbuntuColors.purple
  width: mainview.width
  height: mainview.height
    Page {

          header: PageHeader {
          id:pageHeader
          Button{
               color:"#00000000"
              id:headButton
              height:parent.height;
              width:units.gu(7)
          Icon {
              anchors.verticalCenter: parent.verticalCenter;
                  id: leavePage
          width:units.gu(4)
          height:units.gu(4)
              name: "back"
              color: "#ffffff"
          }
          onClicked: pageStack.pop();
                }


          title: "    Выберите остановку"

                              StyleHints {
                                  foregroundColor: "white"
                                  backgroundColor: UbuntuColors.purple
                                  dividerColor:  "#974B93"
                                  contentHeight: units.gu(7)
                              }


                  }
Column {

    width: mainview.width
    height: mainview.height
    ActivityIndicator {
        id: activityIndicator
        anchors.centerIn: parent
        running: true
        visible: false
    }
        Column {

            anchors {

                fill: parent
            }




           TextField {
                  width:units.gu(32); height:units.gu(6);
                 id: stationSearchField
                    placeholderText: "Введите название остановки"
                    onTextChanged: Main.searchStation(stationSearchField.text)
                      font.pixelSize:  units.dp(25)
anchors.top:parent.top;
anchors.topMargin:units.dp(60);
anchors.left:parent.left;
                      anchors {
                          margins: units.gu(2)

                      }
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
 anchors { left: parent.left; right: parent.right; }
                height:50;




                       delegate:ListItem.Base {


                        width:parent.width;height:units.gu(9);

 onClicked:{

pageStack.push(Qt.resolvedUrl("ShowTimetable.qml"));
  Main.chooseStation(itemStation.text,itemStationId.text,itemStationDescryption.text);

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
                        Text{
                            id:itemStationId
                             visible:false
                            text:stationId
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
