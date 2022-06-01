#include <stdio.h>
#include "prog1_asm.h"

char global_C_string[] = "Global String from C file";
int global_C_int = 1000;

int main()
{
  int local_C_int = 50;
  char local_C_string[] = "Local string from C main";

  puts("C: puts...");

  showasm_values(local_C_string, local_C_int);
					
  printf("C: assembly values:\n\tasm_string = %s\n\tasm_int = %d\n",  &asm_string, asm_int);
  
  return 0;
}
