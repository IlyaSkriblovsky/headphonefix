TEMPLATE = app

QT = core gui declarative
CONFIG += qdeclarative-boostable
INCLUDEPATH += /usr/include/applauncherd
LIBS += -lmdeclarativecache

HEADERS =
SOURCES = main.cpp


target.path = /opt/headphonefix/
INSTALLS += target
