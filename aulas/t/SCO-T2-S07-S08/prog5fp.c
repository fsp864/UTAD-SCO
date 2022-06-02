#include <stdio.h>

int cadd(int a, int b)
{
  return (a + b);
}

int cfunction_asm(int, int, int (*)(int, int));

int main()
{
  int a = 10, b = 20;
  int (*function_ptr)(int, int) = &cadd;

  printf("C: Calling cfunction_asm with pointer to cadd(), a=%d, b=%d\n", a, b);

  printf("C: Result of %d + %d via cfunction_asm->cadd() is %d\n", a, b, cfunction_asm(a, b, function_ptr));

  return 0;
}
