import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0
import Ubuntu.Components.ListItems 1.0 as ListItem
import "Main.js" as Main



        Column {
            spacing: units.gu(1)





                       TextField {
                             width:units.gu(32); height:units.gu(6);
                            id: citySearchField
                               placeholderText: "Введите имя города"
                               onTextChanged: Main.searchCity( citySearchField.text)
                               font.pixelSize:  units.dp(25)
                       }




            Item {
                 id: rootItem
                 // create a model item instance
                 ListModel {

                     id: cityModel





                 }
            }

            UbuntuListView{
 Component.onCompleted: Main.getAllCity()
 anchors { left: parent.left; right: parent.right }
                height: units.gu(24)




                  delegate:ListItem.Base {


                        id:delegateItem
                        width:parent.width;height:units.gu(7);

                        onClicked: {Main.chooseCity(itemCity.text);pageStack.push("SelectStation.qml") ; }
                        Text{
                            id:itemCity
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            anchors.verticalCenter: parent.verticalCenter

                            font.pixelSize:  units.dp(25)
                            text:cityName
                        }
                    }

                id:cityListView
                anchors.top:stationSearchField.top
                anchors.topMargin:units.gu(15);
                anchors.fill:parent
                model:cityModel

                spacing:4

            }


}

