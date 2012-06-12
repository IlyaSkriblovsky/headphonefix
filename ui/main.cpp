#include <QApplication>
#include <QtDeclarative>
#include <MDeclarativeCache>

#include "process.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication *app = MDeclarativeCache::qApplication(argc, argv);

    QDeclarativeView *view = MDeclarativeCache::qDeclarativeView();

    qmlRegisterType<Process>("QtProcess", 0, 1, "Process");

    view->setSource(QUrl::fromLocalFile("/opt/headphonefix/qml/main.qml"));
    view->showFullScreen();

    return app->exec();
}
