NELEM	equ		10			;number of elements
MIN		fill		4
VECTOR	dcd		10, 11, 12, 13, 14, 10, 10, 17, 80, 19	;sum is 145 or 0x91
		
START	ldr		r2, =VECTOR	;put address VECTOR in r2 (= for address not immediate value)
		ldr		r0, [r2], #1*4
		mov		r1, #1
		
WHILE	cmp		r1, #NELEM	;compare
		beq		ENDWHILE		;if equal to N go to the end
		
		ldr		r3, [r2], #1*4	;put in r3 value in address pointed by r2, with post-indexed increment of 4 bytes (1 word)
IF		cmp		r0, r3
		ble		ENDIF
THEN		mov		r0, r3		;new max
ENDIF	add		r1, r1, #1	;increment counter
		bal		WHILE		;go to the beginning of WHILE
		
ENDWHILE	adr		r2, MIN		;put address ZEROS in r2
		str		r0, [r2]		;put r0 value in address pointed by r2
		end
