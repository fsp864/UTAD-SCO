#include <stdio.h>
#include "prog2v_asm.h"

#define NELEM 6

int main()
{
  int i, v[] = {2, -7, 20, -11, 31, 1};
					
  printf("From");
  for( i = 0 ; i < NELEM; i++)
    printf(" %d,", v[i]);
  printf(" min = %d and max = %d\n", min_asm(v, NELEM), max_asm(v, NELEM)); 

  return 0;
}
