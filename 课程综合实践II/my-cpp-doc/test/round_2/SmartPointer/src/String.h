#ifndef __STRING_H__
#define __STRING_H__
#include "StringRep.h"
#include "UCPointer.h"
class String
{
public:
    String(const char *);
    ~String();
    String(const String &);
    String &operator=(const String &);
    int operator==(const String &) const;
    String operator+(const String &) const;
    int length() const;
    const char *getRaw() const;
    int refCount() const;
private:
    UCPointer<StringRep> m_rep;
};


#endif