#pragma once

#include <QtWidgets/QMainWindow>
#include "ui_MeshWare5646.h"
#include "Widget.h"

class MainWindow : public QMainWindow {
    Q_OBJECT

public:
	MainWindow(QWidget *parent = Q_NULLPTR);

private:
    Ui::MeshWare5646Class ui;
	QMenuBar* MenuBar;
	QToolBar* ToolBar;

	QMenu* FileMenu;
	QMenu* OperationMenu;
	QMenu* HelpMenu;

	QAction* FileLoad;
	QAction* HelpHelp;

	Mesh* ptrMesh;

	QFile* th;

public slots:
	bool FileLoadManagement();
	bool HelpHelpManagement();
};
