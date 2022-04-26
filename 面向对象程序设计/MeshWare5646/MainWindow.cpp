#include "MainWindow.h"
#include <QToolBar>
#include <QProgressBar>
#include <QFileOpenEvent>
#include <QFile>
#include <QSysInfo>
#include <QDesktopServices>
#include <QStatusBar>
#include <QMenuBar>
#include <QWidgetAction>
#include <QMessageBox>
#include <QMainWindow>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent) {

    ui.setupUi(this);

	MenuBar = menuBar();
	ToolBar = addToolBar("Standard");

	FileMenu = MenuBar->addMenu("File");
	OperationMenu = MenuBar->addMenu("Operation");
	HelpMenu = MenuBar->addMenu("Help");

	FileLoad = new QAction(QIcon("./textures/open.png"), "Load", this);
	FileLoad->setShortcut(Qt::CTRL + Qt::Key_I);
	FileMenu->addAction(FileLoad);
	connect(FileLoad, SIGNAL(triggered()), this, SLOT(FileLoadManagement()));

	HelpHelp = new QAction(QIcon("./textures/info.png"), "Help", this);
	HelpHelp->setShortcut(Qt::CTRL + Qt::Key_H);
	HelpMenu->addAction(HelpHelp);
	connect(HelpHelp, SIGNAL(triggered()), this, SLOT(HelpHelpManagement()));

	ToolBar->addAction(FileLoad);
	ToolBar->addAction(HelpHelp);
}
