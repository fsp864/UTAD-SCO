#include <stdio.h>
#include "p11l3-2a_asm.h"
int main()
{
  int i = 0, v[] = { 1, 2, 3, 4, 5, 6, 7, 8 ,9, 0};
		
  printf("Vector =");
  while (v[i] != 0)
    printf(" %d,", v[i++]);
  printf(" size = %d\n", vectorsize_asm(v));
  
  return 0;
}
