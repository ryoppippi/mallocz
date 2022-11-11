#include <stdlib.h>

extern void *malloc(size_t size);
extern void *realloc(void *ptr, size_t size);
extern void free(void *ptr);

#ifdef __cplusplus
void *operator new(size_t size) {
  void *p = malloc(size);
  return p;
}

void operator delete(void *p) noexcept { free(p); }
#endif
