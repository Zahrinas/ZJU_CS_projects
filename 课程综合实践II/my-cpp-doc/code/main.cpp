#include "app/myCppDoc.h"
#include <QtWidgets/QApplication>


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    myCppDoc w;
    w.show();

    return a.exec();
}
