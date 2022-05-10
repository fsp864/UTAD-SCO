		;program_data_space_________________________________________________
VALUE	dcd		5
SUM		fill		4
		
		;program_code_space_________________________________________________
START	adr		r0, VALUE		;get VALUE address
		ldr		r0, [r0]		;get VALUE
		str		r0, [r13, #-4]!	;PUSH VALUE
		sub		r13, r13, #4	;reserve space for SUM in stack
		bl		RSUM			;call RSUM LR=PC and PC=STRLEN BL=Branch to Label
		ldr		r2, [r13], #4	;get result SUM
		add		r13, r13, #4	;remove space from input (VALUE) in stack
		adr		r0, SUM		;get SUM address
		str		r2, [r0] 		;store sum (r2 / output of RSUM) in memory (SUM)
		
		end		;end of program, back to system
		
		;subroutines_code_space_____________________________________________
		;Frame______________________________________________________________
		;VALUE	(input) 	+2 * 4
		;SUM		(output)		+1 * 4
		;LR		(register)		+0 * 4
RSUM		str		r14, [r13, #-4]!	;save LR in stack
		ldr		r0, [r13, #2*4]		;get VALUE N
IFRSUM	cmp		r0, #1
		moveq	r2, #1
		beq		ENDIF
		
RECLALL	sub		r0, r0, #1
		str		r0, [r13, #-4]!	;PUSH VALUE
		sub		r13, r13, #4	;reserve space for SUM in stack
		bl		RSUM			;call RSUM LR=PC and PC=STRLEN BL=Branch to Label
		ldr		r2, [r13], #4	;get result SUM N+1
		add		r13, r13, #4	;remove space from input (VALUE of N+1) in stack
		
		ldr		r0, [r13, #2*4]	;get VALUE N
		add		r2, r2, r0
		
ENDIF	str		r2, [r13, #1*4]	;store SUM N
		ldr		r14, [r13], #4	;restore LR from stack
		mov		r15, r14 		;return where it was called PC=LR, should be BX LR or B LR
