#include <stdio.h>

#pragma align(4)

typedef struct _point3D
{
  int xcoord;
  int ycoord;
  int zcoord;
} point3D;

void add3Ddelta_asm(point3D *, int, int, int);

int main()
{
  int dx = 10, dy = 20, dz = 30;
  point3D p = {2, 4, 6};
					
  printf("Point is [%d, %d, %d]\n", p.xcoord, p.ycoord, p.zcoord);
  printf("Calling add3Ddelta_asm with dx=%d, dy=%d, dz=%d\n", dx, dy, dz);

  add3Ddelta_asm(&p, dx, dy, dz);
  printf("Point is now [%d, %d, %d]\n", p.xcoord, p.ycoord, p.zcoord);

  return 0;
}
