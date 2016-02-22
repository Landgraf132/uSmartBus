import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0

import Ubuntu.Components.ListItems 1.3 as ListItem


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


    width: units.gu(80)
    height: units.gu(100)

 property var db: null
 /*    Loader {
            id: background

            anchors.fill: parent
            source: "SelectStation.qml"
        }
        */


    PageStack {
        id: pageStack
        Component.onCompleted: push(tabs)

        Tabs {
            id: tabs
            Tab {
                title: "Выбор города"
                page: Page {
                    id: tab1id

                    SelectCity{

                        // the first tab1 with page "Tabone.qml"

                    }
                    visible: true
                }
            }
            Tab {
                title: i18n.tr("Выбор остановки")
                id: tab2id

                page: Loader {

                               parent: tab2id

                               anchors {
                                   left: parent.left
                                   right: parent.right
                                   bottom: parent.bottom
                               }

                               source: {if (tabs.selectedTab === tab2id || pageStack.currentPage===tab2id)  {  Qt.resolvedUrl("SelectStation.qml"); }}

                           }


            }
            Tab {
               title: "Расписание"
                id: tab3id
             page:Page{
              ShowTimetable{

             }

            }
            }
            Tab {
               title: "Очистить БД!"
                id: clearBD
                page: Page {
Button{
text:"Очистить БД!"
onClicked:pageStack.p(tab2id)
    //Main.clearBD();
}
                }
            }


        }

    }
}
