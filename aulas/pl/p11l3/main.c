#include <stdio.h>

#include "asmfunc.h"

//int addasm(int, int);
//void showasm(void);

int main()
{
  int a = 10, b = 5, n = 3;
//  int point[3];
  struct Point3D point;

  puts("This is the C code...");

  showasm();							               	 //call assembly showasm
  printf("Call assembly for adding %d (R0) and %d (R1). Result: %d (R0)\n", a, b, addasm(a, b));
  printf("Call assembly for factorial %d (R0). Result: %d (R0)\n", n, factorial(n));

//  point[X] = 10;
//  point[Y] = 11;
//  point[Z] = 12;

//  printf("Call assembly for movepoint with R0 as a pointer.\n\tBefore: (%d, %d, %d)\n", point[X], point[Y], point[Z]);
//  movepoint(point, 1, -1, 10);
//  printf("\tAfter: (%d, %d, %d)\n", point[X], point[Y], point[Z]);

  point.Xcoord = 10;
  point.Ycoord = 11;
  point.Zcoord = 12;

  printf("Call assembly for movepoint with R0 as a pointer.\n\tBefore: (%d, %d, %d)\n", point.Xcoord, point.Ycoord, point.Zcoord);
  movepoint(&point, 1, -1, 10);
  printf("\tAfter: (%d, %d, %d)\n", point.Xcoord, point.Ycoord, point.Zcoord);

	
  return 0;	
}