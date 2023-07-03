#pragma once
#include <string>
#include <fstream>

/**
 * this class used to expand the macro.
 * all the inline comment will be exclude here.
 * all the line start with # will be exclude here.
 */
class MacroExpander {
public:
	std::string process(std::fstream &f);
    void Init();
private:

};
