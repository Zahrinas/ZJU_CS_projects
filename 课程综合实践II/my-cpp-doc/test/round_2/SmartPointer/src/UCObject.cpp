#include "UCObject.h"
void UCObject::decr() {
  m_refCount -= 1;
  if (m_refCount == 0) {
    delete this;
  }
}