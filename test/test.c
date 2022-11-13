#include "test.h"
void test_malloc_free_success(void) {
  int *p = (int *)malloc(sizeof(int) * 10);
  free(p);
}

void test_forget_free(void) {
  int *p = (int *)malloc(sizeof(int) * 10);
  // forget to free p
}
