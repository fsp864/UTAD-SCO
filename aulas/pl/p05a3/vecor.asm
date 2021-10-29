START	adr		r2, VECTOR	;put address VECTOR in r2
		mov		r1, #0		;count from 0 to N-1
		
WHILE	cmp		r1, #NELEM	;compare
		beq		ENDWHILE		;if equal to N go to the end
		
		ldr		r0, [r2]		;put in r0 value in address pointed by r2
		add		r0, r0, #0x20	;add 32 to r0
		str		r0, [r2]		;put r0 value in address pointed by r2
		add		r1, r1, #1	;increment counter
		add		r2, r2, #1*4	;increment pointer of 1 word alignment (32bit/4bytes)
		
		bal		WHILE		;go to the beginning of WHILE
		
ENDWHILE	end
		
NELEM	equ		10			;number of elements
VECTOR	dcd		0, 1, 2, 3, 4, 5, 6, 7, 8, 9
