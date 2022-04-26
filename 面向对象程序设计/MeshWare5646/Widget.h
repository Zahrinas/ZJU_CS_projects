#pragma once

#include <QFile>
#include <QOpenGLWidget>

#include "triple.h"

class Mesh : public QOpenGLWidget {
	Q_OBJECT

public:
	Mesh(QFile* PLY, QWidget* parent = 0);
protected:
	void initializeGL();
	void resizeGL(int width, int height);
	void paintGL();
	void mousePressEvent(QMouseEvent* event);
	void mouseMoveEvent(QMouseEvent* event);
	void wheelEvent(QWheelEvent* event);
private:
	void draw();
	float rotationX;
	float rotationY;
	float rotationZ;
	QPoint lastPos;
	std::vector<triple> Points;
	int zoom;
};