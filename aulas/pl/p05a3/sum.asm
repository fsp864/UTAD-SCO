NELEM	equ		10			;number of elements
SUM		fill		4			;reserve/fill 1 word (32bit/4Bytes) with 0
VECTOR	dcd		10, 11, 12, 13, 14, 15, 16, 17, 18, 19	;sum is 195 or 0x91
		
START	ldr		r2, =VECTOR	;put address VECTOR in r2 (= for address not immediate value)
		mov		r1, #0		;count from 0 to N-1
		mov		r0, #0		;start sum with 0
		
WHILE	cmp		r1, #NELEM	;compare
		beq		ENDWHILE		;if equal to N go to the end
		
		ldr		r3, [r2], #4	;put in r3 value in address pointed by r2, with post-indexed increment of 4 bytes (1 word)
		add		r0, r0, r3	;add value of r3 to the sum
		add		r1, r1, #1	;increment counter
		
		bal		WHILE		;go to the beginning of WHILE
		
ENDWHILE	adr		r2, SUM		;put address SUM in r2
		str		r0, [r2]		;put r0 value in address pointed by r2
		end