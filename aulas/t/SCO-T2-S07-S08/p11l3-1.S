.include "macros.S"

.global		showasm_values,asm_string, asm_int		@export the labels for others modules including the C ones
.type    	showasm_values, %function
	 
.section	.text
@code----------------------------------------------------------------------------~
showasm_values:
			.fnstart

			mov r2, r1			 	@put local_C_int in R2 was in R1
			mov r1, r0 				@put local_C_string in R1 was in R0
			ldr r0, =str_format1
			call printf

			ldr r0, =global_C_int
			ldr r2, [r0]			@ger value from global_C_int address 
			ldr r1, =global_C_string
			ldr r0, =str_format2			
			call printf

			return					@return to C code
			.fnend
@data---------------------------------------------------------------------------
.section		.data
str_format1:	.asciz "ASM: Local C values:\n\tlocal_C_string = %s\n\tlocal_C_int = %d\n"
str_format2:	.asciz "ASM: Global C values:\n\tglobal_C_string = %s\n\tglobal_C_int = %d\n"

asm_string:		.asciz "This is the assembly sting"
asm_int:		.word 123
.end
