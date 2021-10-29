		;SCO-P03A1-01:	load values to regiters and add
		;content:	MOV, ADD, values in binary and hexadecimnal
		
start	mov		r1, #5			;put 5 in r1 register, values starts with #
		mov		r2, #0b00000011	;put 3 in r2 register, value in binary
		mov		r12, #0xff		;put 255 in r12 register, value in hexadecimal
		add		r0, r1, r2		;r0 = r0 + r1
		end
		mov		r3, #3			;not done because of the END before
