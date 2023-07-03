#pragma once
#include <QString>
#include <fstream>
#include <QFont>
#include <QPainter>
#include <QFontMetrics>
using namespace std;

bool isProjectFileName(const QString& s);

int SendMsg(const string& x);

void SetNameFont(QFont &font);

void SetAttributeFont(QFont &font);
