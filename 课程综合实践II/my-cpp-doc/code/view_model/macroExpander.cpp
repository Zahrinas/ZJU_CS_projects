#include "../view_model/macroExpander.h"
using namespace std;

string MacroExpander::process(fstream &f) {
	/* not implemented now */
	string str;
	char buffer[1024];
	while (!f.eof()) {
		f.getline(buffer, 1024);
		if (buffer[0] == '#') continue;
		for (int i = 0; buffer[i]; ++i) 
			if (buffer[i] == '/' && buffer[i + 1] == '/') {
				buffer[i] = 0;
				break;
			}
		str += string(buffer);
	}
	return str;
}

void MacroExpander::Init() { }
