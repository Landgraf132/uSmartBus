TEMPLATE = aux
TARGET = uSmartBus

RESOURCES += uSmartBus.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  uSmartBus.apparmor \
               uSmartBus.png\
view-list-symbolic.svg \
    scope-manager.svg \
    home.svg \
    find.svg \
    compose.svg

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)               

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               uSmartBus.desktop

#specify where the qml/js files are installed to
qml_files.path = /uSmartBus
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /uSmartBus
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /uSmartBus
desktop_file.files = $$OUT_PWD/uSmartBus.desktop
desktop_file.CONFIG += no_check_exist

INSTALLS+=config_files qml_files desktop_file

DISTFILES += \
    Main.js \
    SelectStation.qml \
    ShowTimetable.qml \
    SelectCity.qml \
    MainMenu.qml \
    SelectOfTop10Station.qml


