@fatorial
.include	"equs.S"
.include	"macros.S"
.global		_start
.section	.text
@program entry------------------------------------------------------------------
_start: mov r7, #OS_WRITE
		mov r0, #OS_STDOUT
		ldr r1, =msg			@R1 with message address
		mov r2, #29				@R2 with message length
		swi 0

		mov r0, #10				@int n
		push r0					@preserver valor de entrada
 		call fatorial			@call the fatorial in C

		mov r2, r0
		pop r1					@restaurar entrada em r1
		ldr r0, =sformat		@printf arg 0 in r0 (formatting string)
		call  printf

exit:	mov r7, #OS_EXIT
		mov r0, #NORMAL
		swi 0
@data---------------------------------------------------------------------------
.section	.data
msg:		.ascii "Vou calcular o fatorial de 5\n"
sformat:	.asciz "Factorial (%d): %d\n"
.end
