NELEM		equ		10			;number of elements
ZEROS		fill	1*4
VECTOR		dcd		10, 0, 12, 13, 14, 0, 10, 17, 0, 19	;3 zeros
		
START		ldr		r2, =VECTOR	;put address VECTOR in r2 (= for address not immediate value)
			mov		r1, #0		;count from 0 to N-1
			mov		r0, #0		;zeros count
		
WHILE		cmp		r1, #NELEM	;compare
			beq		ENDWHILE	;if equal to N go to the end
		
			ldr		r3, [r2], #1*4
IF			cmp		r3, #0
			bne		ENDIF
THEN		add		r0, r0, #1	;increment zeros count
ENDIF
			add		r1, r1, #1	;increment counter
			bal		WHILE		;go to the beginning of WHILE
ENDWHILE
			adr		r2, ZEROS	;put address ZEROS in r2
			str		r0, [r2]	;put r0 value in address pointed by r2
			end
