NELEM		equ		10			;number of elements
MAX			fill	4
VECTOR		dcd		10, 11, 12, 13, 14, 10, 10, 17, 80, 19
		
START		ldr		r2, =VECTOR	;put address VECTOR in r2 (= for address not immediate value)
			ldr		r0, [r2], #1*4
			mov		r1, #1
		
WHILE		cmp		r1, #NELEM	;compare
			beq		ENDWHILE	;if equal to N go to the end
		
			ldr		r3, [r2], #1*4
IF			cmp		r0, r3
THEN		movlt	r0, r3		;R0 with new MAX
ENDIF
			add		r1, r1, #1	;increment counter
			bal		WHILE		;go to the beginning of WHILE
ENDWHILE
			adr		r2, MAX		;put r2 with address MAX
			str		r0, [r2]		;put r0 value in address pointed by r2
			end
