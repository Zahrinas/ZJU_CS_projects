#include "MainWindow.h"
#include "MainWindowRuntime.h"
#include <QMessageBox>
#include <QFileDialog>

#include <gl/glut.h>

#include "Widget.h"
#include "Debug.h"

void DisplayMesh(Mesh* ptr) {
	ptr->resize(600, 400);
	ptr->show();
}

bool MainWindow::FileLoadManagement() {
	QString path = QFileDialog::getOpenFileName();
	if (path != "") {
		std::string str = path.toStdString();
		int s = str.length();
		if (str.substr(s - 4, s) != ".PLY" && str.substr(s - 4, s) != ".ply") {
			SendMsg("Please open .ply files.");
			return 0;
		}
		th = new QFile(path);
		th->open(QIODevice::ReadOnly);
		ptrMesh = new Mesh(th);
		DisplayMesh(ptrMesh);
	}
	return 1;
}

bool MainWindow::HelpHelpManagement() {
	SendMsg("Please read the report.");
	return 1;
}