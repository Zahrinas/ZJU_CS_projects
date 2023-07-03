#pragma once
#include "../common/common.h"

class Block {
    bool not_show;
    int width, height;
    shared_ptr<Class> this_class;

public:
    Block(const int& w, const int& h, shared_ptr<Class> c)
        :not_show(0), width(w), height(h), this_class(c) {
    }

    bool operator<(const Block& np) const {
        return this_class->getName() < np.getThisClass()->getName();
    }

    int getWidth() const {
       return width;
    }

    int getHeight() const {
       return height;
    }

    bool get_show() const{
        return not_show;
    }

    shared_ptr<Class> getThisClass() const {
       return this_class;
    }

    void setShow(const bool& nshow) {
       not_show = nshow;
    }
};
