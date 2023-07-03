#pragma once

#include "../windows/mainWindow.h"
#include "../view_model/parser.h"
#include <QMessageBox>
#include <QFileDialog>
#include <QScrollBar>
#include <QCheckBox>

class myCppDoc {
public:
    /* binding at initialize function */
    myCppDoc();

    /* start to display */
    void show();
private:
    mainWindow m_mainWindow;
    Parser m_parser;
};
