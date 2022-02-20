#include <stdio.h>

char text[]="This is C calling... with variable text";

int cadd(int a_r0, int b_r1)
{	
  return a_r0 + b_r1;
}

void cfunction()
{
    puts(text);
	//puts("This is the C code");
//  printf("This is the C code...with printf\n");
}
