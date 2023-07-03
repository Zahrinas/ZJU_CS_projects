#ifndef __STRINGREP_H__
#define __STRINGREP_H__
#include "UCObject.h"
#include <string.h>
class StringRep : public UCObject {
 public:
  StringRep(const char *);
  ~StringRep();
  StringRep(const StringRep &);
  int length() const { return strlen(m_pChars); }
  int equal(const StringRep &) const;
  const char* GetRaw() const { return m_pChars; }

 private:
  char *m_pChars;  // reference semantics -- no assignment op!
  void operator=(const StringRep &) {}
};

#endif