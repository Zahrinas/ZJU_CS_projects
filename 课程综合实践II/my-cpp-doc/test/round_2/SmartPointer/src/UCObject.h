#ifndef __UCOBJECT_H__
#define __UCOBJECT_H__
#include <assert.h>
class UCObject {
 public:
  UCObject() : m_refCount(0) {}
  virtual ~UCObject() { assert(m_refCount == 0); };
  UCObject(const UCObject&) : m_refCount(0) {}
  void incr() { m_refCount++; }
  void decr();
  int references() { return m_refCount; }

 private:
  int m_refCount;
};

#endif