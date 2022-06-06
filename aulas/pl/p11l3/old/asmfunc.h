#define X	0
#define Y	1
#define Z	2

struct Point3D
{
  int Xcoord;
  int Ycoord;
  int Zcoord;
};

int addasm(int, int);
void showasm(void);
int factorial(int n);
//int * movepoint(int * point, int deltaX, int deltaY, int deltaZ);
void movepoint(struct Point3D * point, int deltaX, int deltaY, int deltaZ);