import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3


import "Main.js" as Main

Column {

    width: units.gu(80)
    height: units.gu(95)

        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }

 Item {

        width:anchors.width; height:50;
            TextField {
                  width:units.gu(32); height:units.gu(6);
                 id: stationSearchField
                    placeholderText: "Введите название остановки"
                    onTextChanged: Main.searchStation(stationSearchField.text)
            }
}
            Item {
                 id: rootItem
                 // create a model item instance
                 anchors.top:stationSearchField.top
                 anchors.topMargin:50

                 ListModel {

                     id: stationModel


                 }
            }

            ListView{
 Component.onCompleted: {Main.getAllStation();}

                width:anchors.width; height:50;
                Component{

                    id:stationDelegate

                   Button{


                        id:delegateItem
                        width:parent.width;height:units.gu(9);
 onClicked:{
     pageStack.push(tab3id);

  Main.chooseStation(itemStation.text);
 }

                        Text{

                            id:itemStation
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
                }
                id:stationListView
                anchors.top:stationSearchField.top
                   anchors.topMargin:units.gu(45);
                anchors.fill:parent
                model:stationModel
                delegate:stationDelegate
                spacing:4

            }

}
}



