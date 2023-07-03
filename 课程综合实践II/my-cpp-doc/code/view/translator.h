#pragma once

#include "../view/viewTypes.h"
#include <memory>
#include <set>

class Translator {
private:
    Block classToBlock(const shared_ptr<Class> c);
public:
    set<Block> toBlockSet(const list<shared_ptr<Class>>* lis);
};
