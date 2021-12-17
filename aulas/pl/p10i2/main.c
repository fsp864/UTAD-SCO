#include <stdio.h>

#include "asmfunc.h"

//int addasm(int, int);
//void showasm(void);

int main()
{
  int a = 10, b = 5;

  puts("This is the C code...");

  showasm();							               	 //call assembly showasm
  printf("Call assembly for adding %d (R0) and %d (R1). Result: %d (R0)\n", a, b, addasm(a, b));
	
  return 0;	
}