#include "test.hpp"

void test_new_delete_success(void) {
  int *p = new int;
  *p = 1;
  delete p;
}

void test_new_forget_delete(void) {
  int *p = new int;
  *p = 1;
  // forget to delete p
}
