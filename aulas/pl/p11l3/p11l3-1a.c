#include <stdio.h>
#include "p11l3-1a_asm.h"
int main()
{
  int a = 12, b = 65;
					
  printf("In C before reverse call: a = %d, b = %d\n",  a, b);
  reverse_asm(&a, &b);
  printf("In C after reverse call: a = %d, b = %d\n",  a, b);
  
  return 0;
}
