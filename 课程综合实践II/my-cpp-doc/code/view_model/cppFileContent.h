#pragma once

#include "../common/common.h"
#include <string>
#include <queue>
#include <memory>
#include <map>

/**
 * this class use to seperate the cpp file into word
 */
class CppFileContent {
public:
	CppFileContent() {}
    void Init();
    void pushBack(std::string file_content);
    void toClasses(std::list<shared_ptr<Class>>& classes);
private:
	std::map<std::string, shared_ptr<Class> > name2class;
};
