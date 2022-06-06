#include <stdio.h>
#include "p11l3-2b_asm.h"
//void code_decode_text_asm(char *, char);
int main()
{
  char text[] = "Not coded text", key = '.';
		
  printf("text = %s (not coded)\n", text);
  code_decode_text_asm(text, key);
  printf("text = %s (encoded)\n", text);
  code_decode_text_asm(text, -key);
  printf("text = %s (decoded)\n", text);
  
  return 0;
}
