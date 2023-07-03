#pragma once

#include "../common/common.h"
#include "../view/viewTypes.h"
#include <QOpenGLWidget>
#include<set>

using namespace std;

struct PointXY {
    int x, y, w, h;
};

class drawArea : public QOpenGLWidget {
	Q_OBJECT
public:
    drawArea(QWidget* parent);
    void setBlocks(const set<Block>& B);
	void setBlockVisual(const string& BlockName, const bool& nvisual);
protected:
	void mouseMoveEvent(QMouseEvent* event);
	void wheelEvent(QWheelEvent* event);

	void initializeGL();
	void resizeGL(int width, int height);
	void paintGL();
private:
	const static int base_width;
	const static int base_height;
	int zoom;
	set<Block> blocks;
	vector<struct PointXY> rectangle;
};
