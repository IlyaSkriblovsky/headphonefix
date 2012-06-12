TEMPLATE = app

QT = core gui declarative
CONFIG += qdeclarative-boostable

HEADERS = process.h
SOURCES = main.cpp process.cpp

target.path = /opt/headphonefix/
INSTALLS += target

qml.files = *.qml
qml.path = /opt/headphonefix/qml/
INSTALLS += qml
