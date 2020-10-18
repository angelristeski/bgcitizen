TEMPLATE = app

QT += qml quick network
CONFIG += c++11

HEADERS += NetworkManager.h

SOURCES += main.cpp \
           NetworkManager.cpp

RESOURCES += qml.qrc \
    res.qrc

win32:RC_ICONS += res/bg.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android


