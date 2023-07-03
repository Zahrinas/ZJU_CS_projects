#include "StringRep.h"
StringRep::StringRep(const char* s) {
  if (s) {
    int len = strlen(s) + 1;
    m_pChars = new char[len];
    strcpy(m_pChars, s);
  } else {
    m_pChars = new char[1];
    *m_pChars = '\0';
  }
}
StringRep::~StringRep() { delete[] m_pChars; }
StringRep::StringRep(const StringRep& sr) {
  int len = sr.length();
  m_pChars = new char[len + 1];
  strcpy(m_pChars, sr.m_pChars);
}
int StringRep::equal(const StringRep& sp) const {
  return (strcmp(m_pChars, sp.m_pChars) == 0);
}