		;memory_data_space_________________________________________________
SUBR1_A	FILL		4
SUBR1_B	FILL		4
SUBR1_R	FILL		4
		
		;program_code_space_________________________________________________
MAIN		mov		r1, #5
		mov		r2, #100
		
		adr		r0, SUBR1_A
		str		r1, [r0]		;put in input SUBR1_A value of R1
		adr		r0, SUBR1_B
		str		r2, [r0]		;put in input SUBR1_B value of R2
MAINCALL	BL		SUBR1 		;jump to subroutine SUBR1 but save AFTERCALL in LR
AFTERCALL	adr		r0, SUBR1_R
		ldr		r0, [r0]		;get output SUBR1_R value of R0
		end
		
		;subroutines_code_space_____________________________________________
SUBR1	adr		r0, SUBR1_A 	;A value address in associated memory
		ldr		r1, [r0]		;get in input SUBR1_A value of R1
		adr		r0, SUBR1_B 	;B value address in associated memory
		ldr		r2, [r0]		;put in input SUBR1_B value of R2
		add		r3, r1, r2	;add values in associated memory
		adr		r0, SUBR1_R	;R value address
		str		r3, [r0]	 	;put r0 in SUBR1_R
		MOV		R15, R14		;return to caller
