#include "widget.h"
#include "Debug.h"
#include <QMouseEvent>
#include <QColorDialog>
#include <gl/glut.h>


Mesh::Mesh(QFile* PLY, QWidget *parent): QOpenGLWidget(parent) {
	double x, y, z;
	QString le;

	le = PLY->readLine();
	while(le != "end_header\n" && le != "end_header\r\n") le = PLY->readLine();
	le = PLY->readLine();

	while (sscanf(le.toStdString().data(), "%lf%lf%lf", &x, &y, &z) == 3) {
		Points.push_back(triple{ x,y,z });
		le = PLY->readLine();
	}

	rotationX = 0.0;
	rotationY = 0.0;
	rotationZ = 0.0;

	zoom = 1.0;
}

void Mesh::initializeGL()
{
	glClearColor(0,0,0,1);
	glShadeModel(GL_FLAT);
}

void Mesh::resizeGL(int width, int height)
{
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glFrustum(-float(width) / height, float(width) / height, -1.0, +1.0, 4.0, 15.0);
	glMatrixMode(GL_MODELVIEW);
}

void Mesh::paintGL()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	draw();
}

void Mesh::draw()
{
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	glTranslatef(0.0, 0.0, -10.0);
	glRotatef(rotationX, 1.0, 0.0, 0.0);
	glRotatef(rotationY, 0.0, 1.0, 0.0);
	glRotatef(rotationZ, 0.0, 0.0, 1.0);

	for (auto i = Points.begin();i != Points.end();++i) {
		glBegin(GL_POINTS);
		glColor3f(1, 1, 0);
		glVertex3f(i->x * zoom, i->y * zoom, i->z * zoom);
		glEnd();
	}
}

void Mesh::mousePressEvent(QMouseEvent *event)
{
	lastPos = event->pos();
}

void Mesh::mouseMoveEvent(QMouseEvent* event)
{
	float dx = (event->x() - lastPos.x()) / float(width());
	float dy = (event->y() - lastPos.y()) / float(height());
	if (event->buttons()) {
		if (Qt::LeftButton) {
			rotationX -= 180 * dy;
			rotationY -= 180 * dx;
		}
		else if (Qt::RightButton) {
			rotationX -= 180 * dy;
			rotationZ -= 180 * dx;
		}
	}
	lastPos = event->pos();
	update();
}

void Mesh::wheelEvent(QWheelEvent* event) {
	zoom += event->delta() / 120;
	if (zoom < 1) zoom = 1;
	update();
}