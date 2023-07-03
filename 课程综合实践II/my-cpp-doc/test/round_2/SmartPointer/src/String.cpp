#include "String.h"
#include <string.h>
String::String(const char* s) : m_rep(0) { m_rep = new StringRep(s); }
String::~String() {}  // Again, note constructor for rep in list.
String::String(const String& s) : m_rep(s.m_rep) {}
String& String::operator=(const String& s) {
  m_rep = s.m_rep;  // let smart pointer do work!
  return *this;
}
int String::operator==(const String& s) const { // overloaded -> forwards to StringRep
  return m_rep->equal(*s.m_rep);  // smart ptr *
}
int String::length() const { return m_rep->length(); }
int String::refCount() const { return m_rep->references(); }
String String::operator+(const String &that) const {
    char* nstr = new char[this->length() + that.length() + 1];
    nstr[0] = 0;
    strcat(nstr, this->getRaw());
    strcat(nstr, that.getRaw());
    return String(nstr);
}
const char* String::getRaw() const {
    return m_rep->GetRaw();
}