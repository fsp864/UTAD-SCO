#include <stdio.h>

char text_from_c[] = "texto do modulo C";

void cfunction(int a, int b)
{ 
  puts("This is the C code");
  printf("%d + %d = %d\n", a, b, a + b);
}