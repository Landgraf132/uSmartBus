import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import QtQml 2.0
import "Main.js" as Main

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "ShowTimetable"



    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */



    property var locale: Qt.locale()
    property date currentTime: new Date()
    property string timeString
    width: mainview.width
    height: mainview.height



    Page {


header: PageHeader {
id:pageHeaderId



title:  "     "+Main.getCurrentStantionInfo("name");
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
                    StyleHints {
                        foregroundColor: "white"
                        backgroundColor: "#996BC1"
                        dividerColor: "#762572"
                        contentHeight: units.gu(7)
                    }


                    trailingActionBar {
                        actions: [
                            Action {
                                iconName: "reload"
                                           text: "reload"
                                           onTriggered: {
                                               currentTime=new Date();

                                               timeString = currentTime.toLocaleTimeString(locale, "hh:mm:ss");
                                               lastTimeUpdate.text= "Последний раз обновлялось в: "+"<b>"+timeString+"</b>" ;
                                               Main.getTimetable();

                                           }

                            },
                            Action {
                                iconName: "starred"
                                          text: "Favorite"
                                          onTriggered: {


                                          }
                            }
                        ]
                    }
        }

        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }
            Item {
                id: rootItem
                // create a model item instance



                ListModel {
                    id: timetableModel

                }
            }
            height:80
            Item {
                Timer {
                    interval: 6500; running: true; repeat: true
                    onTriggered: {
                        Main.getTimetable();
                        currentTime=new Date();
                        timeString = currentTime.toLocaleTimeString(locale, "hh:mm:ss");
                        lastTimeUpdate.text= "Последний раз обновлялось в: "+"<b>"+ timeString+"</b>" ;

                    }
                }


            }

            Label{
                fontSize: "large";
                anchors.top:parent.top;
                anchors.topMargin: units.gu(6);
                id:stantionDescr;
                anchors.left:parent.left;
                text:Main.getCurrentStantionInfo("descr");
            }


            Label{

                anchors.top:stantionDescr.top;
                anchors.topMargin:units.gu(4);
                id:lastTimeUpdate
                anchors.left:parent.left;
                text:"Последний раз обновлялось в: -"
            }



            //Title Table
            Row{
                id:rowTable
                width:parent.width;height:units.gu(6);
                anchors.top:lastTimeUpdate.bottom;
                anchors.topMargin: units.gu(2);
                Rectangle{

                    id:rectBusNameBlockTitle
                    width:units.gu(9);height:parent.height;
                    color: "#FEFEFE"


                    Text{

                        id:itemBusNameTitle


                        color:"#666A6D";
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize:  units.dp(13)
                        text:"Маршрут"

                    }

                }


                Rectangle{

                    id:rectTimeLeftTitle
                    width:units.gu(13);height:parent.height;
                    color: "#EBEFF2"

                    Text{
                        id:itemTimeLeftTitle
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter:parent.horizontalCenter
                        color:"#666A6D";
                        font.pixelSize:  units.dp(13)
                        text:"Будет через"

                    }
                }
                Rectangle{
                    color: "#FEFEFE"
                    width:mainview.width-rectTimeLeftTitle.width-rectBusNameBlockTitle.width  ;height:parent.height;
                    anchors.right: timetableDelegate.right
                    Text{
                        id:itemDirect


                        color:"#666A6D";
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter:parent.horizontalCenter
                        font.pixelSize:  units.dp(13)
                        text:"Куда направляется"
                    }
                }
            }




            ListView  {
                Component.onCompleted: { Main.getTimetable();}
                width:anchors.width; height:units.gu(6);
                anchors.top:rowTable.bottom;
                anchors.topMargin:units.gu(21);
                Component{
                    id:timetableDelegate

                    Rectangle{

                        color:"#888888"
                        width:parent.width;height:units.gu(6);
                        id:blockTimetableListModel
                        Row{
                            id:rowAll
                            width:parent.width;height:parent.height;
                            Rectangle{

                                id:rectBusNameBlock
                                width:units.gu(9);height:parent.height;
                                color: "#FEFEFE"

                                Rectangle{
                                    id:rectBusNameText
                                    width:units.gu(8) ;height:units.gu(4);
                                    color: "#fc4949"


                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter:parent.horizontalCenter
                                    Text{

                                        id:itemBusName
                                        color: "#ffffff"


                                        anchors.horizontalCenter: rectBusNameText.horizontalCenter
                                        anchors.verticalCenter: rectBusNameText.verticalCenter
                                        font.pixelSize:  units.dp(14)
                                        text:busName
                                        font.bold: true
                                    }
                                }
                            }


                            Rectangle{

                                id:rectTimeLeft
                                width:units.gu(13);height:parent.height;
                                color: "#EBEFF2"

                                Text{
                                    id:itemTimeLeft
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter:parent.horizontalCenter
                                    color:"#666A6D";
                                    font.pixelSize:  units.dp(13)
                                    text:timeLeft
                                    font.bold: true
                                }
                            }
                            Rectangle{
                                color: "#FEFEFE"
                                width:mainview.width-rectTimeLeft.width-rectBusNameBlock.width  ;height:parent.height;
                                anchors.right: timetableDelegate.right
                                Text{
                                    id:itemDirect


                                    color:"#666A6D";
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter:parent.horizontalCenter
                                    font.pixelSize:  units.dp(14)
                                    text:direct
                                }
                            }
                        }

                    }
                }
                id:timetableListView

                spacing:1
                anchors.fill:parent
                model:timetableModel
                delegate:timetableDelegate


            }

        }



    }
}
