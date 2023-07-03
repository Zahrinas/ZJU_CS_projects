#include "../view/drawArea.h"
#include "../view/viewCmFunctions.h"
#include <fstream>
#include <vector>
#include <QPainter>
#include <cmath>

#include <QWheelEvent>
#include <QApplication>
//#include <gl/glut.h>

using namespace std;
fstream db_err_v("View_ErrorLog.txt", fstream::out);

struct line
{
	double x1;
	double y1;
	double x2;
	double y2;
};

vector<PointXY> paint_strategy(set<Block> &blocks, QPainter &painter, int & fw, int & fh);
void DrawArrow(QPainter &painter, PointXY& sp, PointXY& ep, vector<PointXY>&distribution);

drawArea::drawArea(QWidget *parent)
    : QOpenGLWidget(parent), zoom(45), blocks() {
}

const int drawArea::base_width = 40;
const int drawArea::base_height = 30;

void drawArea::setBlocks(const set<Block> &B){
    blocks=B;
}

void drawArea::mouseMoveEvent(QMouseEvent* event) {

}
void drawArea::wheelEvent(QWheelEvent* event) {
	zoom += event->delta() / 120;
	if (zoom < 30) zoom = 30;
	resize(base_width*zoom, base_height*zoom);
    update();
}

void drawArea::setBlockVisual(const string& BlockName, const bool& nvisual) {
    Block b(0, 0, make_shared<Class>(BlockName));
	auto i=blocks.find(b);
	b = *i;
	blocks.erase(i);
	b.setShow(nvisual);
	blocks.insert(b);
}

void drawArea::initializeGL() {
	//glClearColor(1, 1, 1, 1);
}

void drawArea::resizeGL(int width, int height) {

}

void drawArea::paintGL() {
	int fw = 0;
	int fh = 0;
    const int intervel = 20;
	//initialize: set the white background
	QPainter paint(this);
	paint.setPen(Qt::NoPen);
	paint.setBrush(Qt::white);
	paint.drawRect(rect());
	paint.setPen(Qt::SolidLine);
	
	//preparations
	QFont font;
	rectangle = paint_strategy(blocks, paint, fw, fh);
	vector<PointXY>::iterator s = rectangle.begin();
	set<Block>::iterator b = blocks.begin();

	//Paint the blocks
	while(b!=blocks.end()&&s!=rectangle.end())
	{
		if (b->get_show())
		{
			b++; s++;
			continue;
		}
		//Paint the Rectangle
		paint.setPen(QPen(QColor(0x7f, 0xb5, 0xa7), 2));
		paint.drawRect(s->x,s->y,fw, fh);

		//Text the names
		SetNameFont(font);
		paint.setFont(font); 
		paint.setPen(QPen(QColor(0x75, 0x75, 0x75), 2));
		QFontMetrics Metrics(font);
        QString tmp_name(b->getThisClass()->getName().c_str());
		paint.drawText(s->x+ fw/2-Metrics.width(tmp_name)/2,s->y+Metrics.height()+intervel,tmp_name);
		paint.setPen(QPen(QColor(0x7f, 0xb5, 0xa7), 1.25));
		int tmp_y = s->y + Metrics.height() + 2*intervel;
		paint.drawLine(s->x, tmp_y, s->x+fw,tmp_y);

		int tmp_x = s->x+ fw / 6;
		//Text the components
		SetAttributeFont(font);
		paint.setFont(font);
		paint.setPen(QPen(Qt::black, 2));
        vector<string> tmp_v = b->getThisClass()->getComponents();
		vector<string>::iterator a = tmp_v.begin();
		if (a == tmp_v.end())tmp_y += intervel;
		Metrics = QFontMetrics(font);
		for (; a != tmp_v.end(); a++)
		{
			tmp_y += Metrics.height()+intervel;
			QString tmp_attribute(a->c_str());
			paint.drawText(tmp_x, tmp_y, tmp_attribute);
		}
		tmp_y += intervel;
		paint.setPen(QPen(QColor(0x7f, 0xb5, 0xa7), 2));
        if(b->getThisClass()->getComponents().empty()&& b->getThisClass()->getFunctions().empty())
			paint.drawLine(s->x, s->y + s->h / 2, s->x + fw, s->y + s->h / 2);
		else paint.drawLine(s->x, tmp_y, s->x + fw, tmp_y);
		//Text the functions
		SetAttributeFont(font);
		paint.setFont(font);
		paint.setPen(QPen(Qt::black, 2));
        tmp_v = b->getThisClass()->getFunctions();
		a = tmp_v.begin();
		Metrics = QFontMetrics(font);
		for (; a != tmp_v.end(); a++)
		{
			tmp_y += Metrics.height() + intervel;
			QString tmp_attribute(a->c_str());
			paint.drawText(tmp_x, tmp_y, tmp_attribute);
		}
		//next one
		b++; s++;
	}

	//Paint the relations
	//Paint the SuperClasses
	
	
	paint.setPen(QPen(QColor(0x75, 0x75, 0x75), 2));
	b = blocks.begin(); s = rectangle.begin();
	while (b != blocks.end() && s != rectangle.end())
	{
		if (b->get_show())
		{
			b++; s++;
			continue;
		}
        vector<string> SuperClass = b->getThisClass()->getSuperclasses();
		vector<string>::iterator sc = SuperClass.begin();
        db_err_v << b->getThisClass()->getName()<<":"<<endl;
		while (sc != SuperClass.end())
		{
			db_err_v <<*sc<<endl;
			vector<PointXY>::iterator s2 = rectangle.begin();
			set<Block>::iterator b2 = blocks.begin();
			while (b2 != blocks.end() && s2 != rectangle.end())
			{
                string tmp_name = b2->getThisClass()->getName();
				if (tmp_name.compare(*sc)==0)break;
				b2++; s2++;
			}
			if (b2->get_show())
			{
				sc++;continue;
			}
			paint.setPen(QPen(Qt::darkGreen,2));
			DrawArrow(paint, *s, *s2,rectangle);
			sc++;
		}
		b++; s++;
	}
	
	//Paint the Attributes
	
}



vector<PointXY> paint_strategy(set<Block> &blocks, QPainter &painter,int & fw, int & fh)
{
	//unifie the width and the height
	set<Block>::iterator b;
	for (b = blocks.begin(); b != blocks.end(); b++)
	{
		if (b->getHeight() > fh)fh = b->getHeight();
		if (b->getWidth() > fw)fw = b->getWidth();
	}
	vector<PointXY> p;
	//initial strategy: sequential
	//arrange the start positions of the blocks and the Window
	const int width_intervel = fw/4;
	const int height_intervel = fh/4;
	int i=0;
	for (b = blocks.begin(); b != blocks.end(); b++,i++)
	{
        PointXY tmp;
		tmp = {width_intervel,height_intervel+i*(fh+height_intervel),fw,fh};
		p.push_back(tmp);
		b++; 
		if (b == blocks.end())
		{
			i++;
			break;
		}
		tmp = { 2 * width_intervel + fw,height_intervel + i * (fh + height_intervel),fw,fh };
		p.push_back(tmp);
	}
	double final_width = 3 * width_intervel + 2 * fw;
	double final_height = height_intervel + i * (fh + height_intervel);
	if (final_width * 3 > final_height * 4) final_height = final_width * 3 / 4;
	else final_width = final_height * 4 / 3;
	painter.setWindow(0,0, final_width, final_height);
	return p;
	//the optimized strategy

}

void DrawArrow(QPainter &painter, PointXY& sp, PointXY& ep,vector<PointXY>&distribution)
{
	QVector<QLineF> lines;
	double x1 = sp.x + sp.w / 2.0;
	double y1 = sp.y + sp.h / 2.0;
	double x2 = ep.x + ep.w / 2.0;
	double y2 = ep.y + ep.h / 2.0;
	int flag1,flag2;//used to identify the direction
	if (x1 < x2)
	{
		if (y1 < y2)
		{
			if(y1 + sp.h / 2.0< y2 - ep.h /2.0)
			{
				y1 = sp.y + sp.h;
				y2 = ep.y;
				flag1 = 2;
				flag2 = 1;
			}
			else
			{
				x1 = sp.x + sp.w;
				x2 = ep.x;
				flag1 = 4;
				flag2 = 3;
			}
		}
		else
		{
			if (y1 - sp.h / 2.0 > y2 + ep.h / 2.0)
			{
				y1 = sp.y;
				y2 = ep.y+ep.h;
				flag1 = 1;
				flag2 = 2;
			}
			else
			{
				x1 = sp.x + sp.w;
				x2 = ep.x;
				flag1 = 4;
				flag2 = 3;
			}
		}
	}
	else
	{
		if (y1 < y2)
		{
			if (y1 + sp.h / 2.0 < y2 - ep.h / 2.0)
			{
				y1 = sp.y + sp.h;
				y2 = ep.y;
				flag1 = 2;
				flag2 = 1;
			}
			else
			{
				x1 = sp.x;
				x2 = ep.x+ep.w;
				flag1 = 3;
				flag2 = 4;
			}
		}
		else
		{
			if (y1 - sp.h / 2.0 > y2 + ep.h / 2.0)
			{
				y1 = sp.y;
				y2 = ep.y + ep.h;
				flag1 = 1;
				flag2 = 2;
			}
			else
			{
				x1 = sp.x;
				x2 = ep.x+ep.w;
				flag1 = 3;
				flag2 = 4;
			}
		}
	}
	
    vector<line> tmplines;
	
    line tmpl;
	if ((flag1 == 1 && flag2 == 2)||(flag1 == 2 && flag2 == 1))
	{
		if (x1==x2)
		{
			tmpl = { x1,y1,x2,y2 };
			tmplines.push_back(tmpl);
		}
		else
		{
			tmpl = { x1,y1,x1,(y1 + y2) / 2 };
			tmplines.push_back(tmpl);
			tmpl = { x2,y2,x2,(y1 + y2) / 2 };
			tmplines.push_back(tmpl);
			tmpl = { x1,(y1 + y2) / 2,x2,(y1 + y2) / 2 };
			tmplines.push_back(tmpl);
		}
	}
	if ((flag1 == 3 && flag2 == 4) || (flag1 == 4 && flag2 == 3))
	{
		if (y1 == y2)
		{
			tmpl = { x1,y1,x2,y2 };
			tmplines.push_back(tmpl);
		}
		else
		{
			tmpl = { x1,y1,(x1 + x2) / 2,y1};
			tmplines.push_back(tmpl);
			tmpl = { x2,y2,(x1 + x2) / 2,y2 };
			tmplines.push_back(tmpl);
			tmpl = { (x1 + x2) / 2,y1,(x1 + x2) / 2,y2 };
			tmplines.push_back(tmpl);
		}
	}
	/*
	bool judge = true;
	while(judge)
	{
		judge = false;
        for (vector<line>::iterator i = tmplines.begin(); i != tmplines.end(); i++)
		{
			if (i->x1 == i->x2)
			{
                vector<PointXY>::iterator d;
				int c=0;
				for (d = distribution.begin(); d != distribution.end(); d++)
				{
					if (i->x1 > d->x&&i->x1 < d->x + d->w)
					{
						double miny = min(y1, y2);
						double maxy = max(y1, y2);
						if (miny<d->y&&maxy>d->y + d->h)
						{
							c = 1;
							break;
						}
						if (miny < d->y&&maxy<d->y + d->h&&maxy>d->y)
						{
							c = 2;
							break;
						}
					}
				}
				if (c != 0)
				{
					if (c == 1)
					{
						if (i->y1 < i->y2)
						{
							i->y1 = d->y - 2.0;
							tmplines.push_back({ i->x2,i->y2,i->x2,d->y + d->h + 2.0});
							tmplines.push_back({ i->x2,d->y + d->h + 2.0,d->x + d->w + 2.0,d->y + d->h + 2.0 });
							tmplines.push_back({ i->x1,d->y - 2.0,d->x + d->w + 2.0,d->y - 2.0 });
							tmplines.push_back({ d->x + d->w + 2.0,d->y + d->h + 2.0,d->x + d->w + 2.0,d->y - 2.0 });
						}
						else
						{
							i->y2 = d->y - 2.0;
							tmplines.push_back({ i->x1,i->y1,i->x1,d->y + d->h + 2.0 });
							tmplines.push_back({ i->x1,d->y + d->h + 2.0,d->x + d->w + 2.0,d->y + d->h + 2.0 });
							tmplines.push_back({ i->x2,d->y - 2.0,d->x + d->w + 2.0,d->y - 2.0 });
							tmplines.push_back({ d->x + d->w + 2.0,d->y + d->h + 2.0,d->x + d->w + 2.0,d->y - 2.0 });
						}
					}
					judge = true; break;
				}
			}
			if (i->y1 == i->y2)
			{


			}
		}
	}
	*/
	//add the lines
    for (vector<line>::iterator i = tmplines.begin(); i != tmplines.end(); i++)
	{
		lines.append(QLineF(i->x1, i->y1, i->x2, i->y2));
	}
	//add the arrow
	const int length1 = 15;
	const int length2 = 30;
	switch (flag2)
	{
		case 1:
			lines.append(QLineF(x2, y2, x2 + length1, y2 - length2));
			lines.append(QLineF(x2, y2, x2 - length1, y2 - length2));
			break;
		case 2:
			lines.append(QLineF(x2, y2, x2 + length1, y2 + length2));
			lines.append(QLineF(x2, y2, x2 - length1, y2 + length2));
			break;
		case 3:
			lines.append(QLineF(x2, y2, x2 - length2, y2 + length1));
			lines.append(QLineF(x2, y2, x2 - length2, y2 - length1));
			break;
		case 4:
			lines.append(QLineF(x2, y2, x2 + length2, y2 + length1));
			lines.append(QLineF(x2, y2, x2 + length2, y2 - length1));
			break;

	}
	painter.drawLines(lines);
}
