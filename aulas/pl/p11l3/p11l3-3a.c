#include <stdio.h>

//#pragma align(4)

typedef struct _point2D
{
  int xcoord;
  int ycoord;
} point2D;

void distance2D_asm(point2D *, point2D *, int *, int *);

int main()
{
  int dx, dy;
  point2D p1 = {2, 4}, p2 = {3, 8};
					
  printf("Points are p1 = [%d, %d] and p2 = [%d, %d]\n", p1.xcoord, p1.ycoord, p2.xcoord, p2.ycoord);
  distance2D_asm(&p1, &p2, &dx, &dy);
  printf("Distance dx = %d, dy = %d\n", dx, dy);

  return 0;
}
