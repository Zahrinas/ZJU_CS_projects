#include "../app/myCppDoc.h"
using namespace std;

myCppDoc::myCppDoc() {
    m_mainWindow.attach_fileProcessor(m_parser.get_fileProcessor());
    m_mainWindow.attach_list_classes(m_parser.get_classes());
    m_parser.attach_Notifier(m_mainWindow.get_finishParseNotifier());
}

void myCppDoc::show() {
    m_mainWindow.show();
}
