#pragma once
#include "../common/common.h"
#include "macroExpander.h"
#include "cppFileContent.h"

class Parser {
public:
    void attach_Notifier(Notifier && notifier);
    FileProcessor get_fileProcessor();
    std::list<shared_ptr<Class>>* get_classes();
private:
    Notifier m_notifier;

    std::list<shared_ptr<Class>> classes;
    MacroExpander m_me;
    CppFileContent m_cfc;
};
