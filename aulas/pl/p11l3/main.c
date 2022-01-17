#include <stdio.h>

#include "asmfunc.h"

//int addasm(int, int);
//void showasm(void);

int main()
{
  int a = 10, b = 5, n = 3;

  puts("This is the C code...");

  showasm();							               	 //call assembly showasm
  printf("Call assembly for adding %d (R0) and %d (R1). Result: %d (R0)\n", a, b, addasm(a, b));
  printf("Call assembly for factorial %d (R0). Result: %d (R0)\n", n, factorial(n));
	
  return 0;	
}