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

    height:80
    Item {
        Timer {
            interval: 5500; running: true; repeat: true
            onTriggered:Main.getTimetable();
        }


    }

            Button{
id:reloadButton
             text:"Обновить\Получить данные";
            onClicked: Main.getTimetable();
            }

            Item {
                 id: rootItem
                 // create a model item instance



                 ListModel {
                     id: timetableModel

                 }
            }




 ListView  {
    Component.onCompleted: { Main.getTimetable();}
        width:anchors.width; height:units.gu(6);
anchors.top:reloadButton.top
anchors.topMargin:units.gu(10);
 Component{
      id:timetableDelegate

Rectangle{

color:"#888888"
    width:parent.width;height:units.gu(6);
id:blockTimetableListModel
  Row{
       width:parent.width;height:parent.height;
Rectangle{

    id:rectBusNameBlock
    width:units.gu(8);height:parent.height;
color: "#FEFEFE"

        Rectangle{
            id:rectBusNameText
            width:units.gu(6) ;height:units.gu(4);
              color: "#fc4949"


                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter:parent.horizontalCenter
              Text{

        id:itemBusName
        color: "#ffffff"


         anchors.horizontalCenter: rectBusNameText.horizontalCenter
        anchors.verticalCenter: rectBusNameText.verticalCenter
          font.pixelSize:  units.dp(16)
        text:busName
        font.bold: true
              }
        }
}


Rectangle{

    id:rectTimeLeft
    width:units.gu(15);height:parent.height;
    color: "#EBEFF2"
anchors.left: rectBusNameText.right
    Text{
        id:itemTimeLeft
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter:parent.horizontalCenter
color:"#666A6D";
           font.pixelSize:  units.dp(16)
        text:timeLeft
 font.bold: true
    }
}
Rectangle{
    color: "#FEFEFE"
    width:parent.width-rectTimeLeft.width-rectBusNameText.width  ;height:parent.height;
anchors.right: timetableDelegate.right
    Text{
        id:itemDirect


color:"#666A6D";
 anchors.verticalCenter: parent.verticalCenter
 anchors.horizontalCenter:parent.horizontalCenter
          font.pixelSize:  units.dp(16)
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




