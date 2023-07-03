#include "../view/translator.h"
#include "../view/viewCmFunctions.h"

#include <QFont>
#include <QPainter>
#include <QFontMetrics>

Block Translator::classToBlock(const shared_ptr<Class> c) {
	const int intervel = 20;
	QFont font;
	SetNameFont(font);
	QFontMetrics Metrics(font);
	int width = Metrics.width(QString::fromStdString(c->getName())), height = Metrics.height();
	vector<string> attr = c->getComponents();
	vector<string> func = c->getFunctions();
	SetAttributeFont(font);
	Metrics = QFontMetrics(font);
	//the interval around the name
	height += 2 * intervel;
	//
	for (int i = 0;i < attr.size();++i) {
		//width is the longest string width of the attributes
		width = max(width, Metrics.width(QString::fromStdString(attr[i])));
		height += Metrics.height()+ intervel;
	}
	height += intervel;
	//
	for (int i = 0; i < func.size(); ++i) {
		//width is the longest string width of the attributes
		width = max(width, Metrics.width(QString::fromStdString(func[i])));
		height += Metrics.height() + intervel;
	}
	height += intervel;
    return Block(width*1.6, height, c);
}

set<Block> Translator::toBlockSet(const list<shared_ptr <Class>>* lis) {
	set<Block> res;
    for (auto i = lis->begin();i != lis->end();++i) {
		res.insert(classToBlock(*i));
	}
	return res;
}
