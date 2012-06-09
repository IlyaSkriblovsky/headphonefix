#include <QApplication>
#include <QtDeclarative>
#include <MDeclarativeCache>
#include <QUrl>

int main(int argc, char *argv[])
{
    QApplication *app = MDeclarativeCache::qApplication(argc, argv);

    QDeclarativeView *view = MDeclarativeCache::qDeclarativeView();
    view->setAttribute(Qt::WA_NoSystemBackground);

    view->setSource(QUrl::fromLocalFile("/opt/headphonefix/main.qml"));
    view->showFullScreen();

    return app->exec();
}
