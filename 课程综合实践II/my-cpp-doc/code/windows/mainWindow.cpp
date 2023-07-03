#include "../windows/mainWindow.h"
using namespace std;

mainWindow::mainWindow(QWidget *parent)
    : QMainWindow(parent) {

    resize(1200, 900);

    MenuBar = menuBar();
    ToolBar = addToolBar("Standard");

    FileMenu = MenuBar->addMenu("File");
    OperationMenu = MenuBar->addMenu("Operation");
    HelpMenu = MenuBar->addMenu("Help");

    FileLoad = new QAction(QIcon(":/myCppDoc/open.png"), "Load File", this);
    FileLoad->setShortcut(Qt::CTRL + Qt::Key_I);
    FileMenu->addAction(FileLoad);

    FileLoadFolder = new QAction(QIcon(":/myCppDoc/open.png"), "Load Folder", this);
    FileLoadFolder->setShortcut(Qt::CTRL + Qt::Key_O);
    FileMenu->addAction(FileLoadFolder);

    FileSaveAs = new QAction(QIcon(":/myCppDoc/save.png"), "Save as", this);
    FileSaveAs->setShortcut(Qt::CTRL + Qt::Key_S);
    FileMenu->addAction(FileSaveAs);


    HelpInfo = new QAction(QIcon(":/myCppDoc/info.png"), "Information", this);
    HelpInfo->setShortcut(Qt::CTRL + Qt::Key_H);
    HelpMenu->addAction(HelpInfo);

    ToolBar->addAction(FileLoad);
    ToolBar->addAction(FileSaveAs);
    ToolBar->addAction(HelpInfo);

    Status = new QStatusBar(this);
    Status->setSizeGripEnabled(0);
    Status->showMessage("Hello, this is your cute status bar.");
    setStatusBar(Status);

    scroll = Q_NULLPTR;
    draw = Q_NULLPTR;
    label= Q_NULLPTR;

    connect(FileLoad, SIGNAL(triggered()), this, SLOT(FileLoadManagement()));
    connect(FileLoadFolder, SIGNAL(triggered()), this, SLOT(FileLoadFolderManagement()));
    connect(FileSaveAs, SIGNAL(triggered()), this, SLOT(FileSaveAsManagement()));
    connect(HelpInfo, SIGNAL(triggered()), this, SLOT(HelpInfoManagement()));
    connect(FileLoad, SIGNAL(hovered()), this, SLOT(FileLoadHovered()));
    connect(FileSaveAs, SIGNAL(hovered()), this, SLOT(FileSaveAsHovered()));
}

Notifier mainWindow::get_finishParseNotifier() {
    return [this]() {
        Blocks = Translator().toBlockSet(list_classes);
        formSelect(Blocks);
        if (draw==Q_NULLPTR) draw = new drawArea(this);
        if (scroll==Q_NULLPTR) scroll = new scrollArea(this);
        draw->setBlocks(Blocks);
        draw->setGeometry(0, 0, 1600, 1200);
        draw->setMinimumSize(1200, 900);
        draw->update();
        scroll->setWidget(draw);
        scroll->setGeometry(0, MenuBar->rect().height() + ToolBar->rect().height(), rect().width() - 200,
            rect().height() - Status->rect().height() - MenuBar->rect().height() - ToolBar->rect().height());
        scroll->show();
    };
}
void mainWindow::showGraph(const list<string>& filelist) {

}

bool mainWindow::FileLoadHovered() {
    Status->showMessage("Load file(s)");
    return 1;
}

bool mainWindow::FileSaveAsHovered() {
    Status->showMessage("Save the image as bmp format");
    return 1;
}

void mainWindow::formSelect(const set<Block>& Blocks) {
    if(label!=Q_NULLPTR) delete label;
    label = new QLabel(this);
    label->setText("Select omitted classes:");
    label->setGeometry(rect().width() - 200,
        MenuBar->rect().height() + ToolBar->rect().height(), 200, 40);
    label->show();
    int checkcnt = 0, checkheight = 30;
    for (int i = 0;i < Checks.size();++i) {
        delete Checks[i];
    }
    Checks.clear();
    BlockNames.clear();
    for (auto i = Blocks.begin();i != Blocks.end();++i) {
        QCheckBox* check = new QCheckBox(this);
        check->setText(QString::fromStdString(i->getThisClass()->getName()));
        Checks.push_back(check);
        BlockNames.push_back(i->getThisClass()->getName());
        check->setGeometry(rect().width() - 200,
            MenuBar->rect().height() + ToolBar->rect().height() + label->rect().height() + checkcnt * checkheight,
            200, checkheight);
        ++checkcnt;
        connect(check, SIGNAL(stateChanged(int)), this, SLOT(StateSwitchManagement()));
        check->show();
    }
}

bool mainWindow::FileLoadManagement() {
    QStringList path = QFileDialog::getOpenFileNames(this, "open", "", "C++ Project files (*.cpp *.h *.c)");
    if (path.size() == 0) return 1;
    list<string> filelist;
    for (auto i = path.begin();i != path.end();++i) {
        if (!isProjectFileName(*i)) continue;
        filelist.push_back(i->toStdString());
    }
    if (filelist.size() == 0) {
        SendMsg("No valid file selected.");
        return 1;
    }
    m_file_processor(filelist);
    return 1;
}

QStringList mainWindow::getAllFiles(const QDir& dir) {
    QStringList path = dir.entryList();
    QStringList ret;
    for (auto i = path.begin();i != path.end();++i) {
        if (*i == ".") continue;
        if (*i == "..") continue;
        QString filepath = dir.absoluteFilePath(*i);
        QFileInfo info(filepath);
        if (info.isDir()) ret += getAllFiles(filepath);
        else ret.push_back(dir.absoluteFilePath(*i));
    }
    return ret;
}

bool mainWindow::FileLoadFolderManagement() {
    QString getDir = QFileDialog::getExistingDirectory();
    if (getDir == "") return 1;
    QDir directory(getDir);
    QStringList path = getAllFiles(directory);
    list<string> filelist;
    for (auto i = path.begin();i != path.end();++i) {
        if (!isProjectFileName(*i)) continue;
        filelist.push_back(directory.absoluteFilePath(*i).toStdString());
    }
    if (filelist.size() == 0) {
        SendMsg("No valid file found.");
        return 1;
    }
    m_file_processor(filelist);
    return 1;
}

bool mainWindow::FileSaveAsManagement() {
    if (draw == Q_NULLPTR) return 1;
    QString path = QFileDialog::getSaveFileName(this, "save as", "untitled.bmp", "Image(.bmp)");
    if (path != "") {
        QImage image = draw->grabFramebuffer();
        image.save(path, "BMP");
        return 1;
    }
    return 1;
}

bool mainWindow::HelpInfoManagement() {
    SendMsg("MyCppDoc v0.1");
    return 1;
}

bool mainWindow::StateSwitchManagement() {
    for (int i = 0; i < Checks.size();++i) {
        auto itr = Blocks.find(Block(0, 0, make_shared<Class>(BlockNames[i])));
        Block b = *itr;
        b.setShow(Checks[i]->isChecked());
        Blocks.erase(itr);
        Blocks.insert(b);
    }
    if (draw==Q_NULLPTR) draw = new drawArea(this);
    if (scroll==Q_NULLPTR) scroll = new scrollArea(this);
    draw->setBlocks(Blocks);
    draw->setGeometry(0, 0, 1600, 1200);
    draw->setMinimumSize(1200, 900);
    draw->update();
    scroll->setWidget(draw);
    scroll->setGeometry(0, MenuBar->rect().height() + ToolBar->rect().height(), rect().width() - 200,
        rect().height() - Status->rect().height() - MenuBar->rect().height() - ToolBar->rect().height());
    scroll->show();
    return 1;
}
