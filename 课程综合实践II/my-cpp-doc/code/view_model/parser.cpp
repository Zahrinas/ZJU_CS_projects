#include "../common/common.h"
#include "../view_model/parser.h"
#include <fstream>
using namespace std;


FileProcessor Parser::get_fileProcessor() {
    return [this](list<string> file_names)->bool {
        m_me.Init();
        m_cfc.Init();
        vector<string> bad_file_names;
        for (const auto &name : file_names) {
          fstream f(name, fstream::in);
          if (!f.is_open()) { bad_file_names.push_back(name); continue; }
          m_cfc.pushBack(m_me.process(f));
        }
        if (bad_file_names.size()) {
          string info;
          for (const auto &name : bad_file_names) info += name + " ";
          // throw m_Exception("Could not open { " + info + "}");
          return 0;
        }
        m_cfc.toClasses(classes);
        m_notifier();
        return 1;
    };
}

void Parser::attach_Notifier(Notifier && notifier) {
    m_notifier = std::move(notifier);
}

list<shared_ptr<Class>>* Parser::get_classes() {
    return &classes;
}
