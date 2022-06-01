#include <stdio.h>
#include "prog3m_asm.h"

#define XDIM 4
#define YDIM 3

int main()
{
  int x, y, v[YDIM][XDIM];
					

  printf("C fill v[%d][%d]:\n", YDIM, XDIM);
  for( y = 0 ; y < YDIM; y++)
  {
    for( x = 0 ; x < XDIM; x++)
    {
      v[y][x] = x * y;
      printf("v[%d][%d] = %d, ", y, x, v[y][x]);
    }
    printf("\n");
  }

  fill2D_asm((int *)v, XDIM, YDIM);

  printf("ASM fill v[%d][%d]:\n", YDIM, XDIM);
  for( y = 0 ; y < YDIM; y++)
  {
    for( x = 0 ; x < XDIM; x++)
    {
      printf("v[%d][%d] = %d, ", y, x, v[y][x]);
    }
    printf("\n");
  }

  return 0;
}
