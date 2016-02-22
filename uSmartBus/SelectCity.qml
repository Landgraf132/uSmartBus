import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0

import "Main.js" as Main



        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }

            Item {


                       TextField {
                             width:units.gu(32); height:units.gu(6);
                            id: stationSearchField
                               placeholderText: "Введите имя города"
                               onTextChanged: Main.searchCity(stationSearchField.text)
                               font.pixelSize:  units.dp(25)
                       }
           }



            Item {
                 id: rootItem
                 // create a model item instance
                 ListModel {

                     id: cityModel





                 }
            }
     Flow {
         anchors.fill: parent
                 anchors.margins: 4
                 height:100
            ListView{
 Component.onCompleted: Main.getAllCity()

                width:anchors.width; height:50;
                Component{

                    id:cityDelegate

                   Button{


                        id:delegateItem
                        width:parent.width;height:units.gu(7);

                        onClicked: {Main.chooseCity(itemCity.text);pageStack.push(tab2id) ; }
                        Text{
                            id:itemCity
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            anchors.verticalCenter: parent.verticalCenter

                            font.pixelSize:  units.dp(25)
                            text:cityName
                        }
                    }
                }
                id:cityListView
                anchors.top:stationSearchField.top
                anchors.topMargin:units.gu(18);
                anchors.fill:parent
                model:cityModel
                delegate:cityDelegate
                spacing:4

            }
        }

}

