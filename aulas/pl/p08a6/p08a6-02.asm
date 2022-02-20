			;program_data_space_________________________________________________
LENGHT1		fill		4
LENGHT2		fill		4
			;STR1	dcd		0x4c4c4548, 0x4f57204f, 0x2144524c, 0x00000000 ;string "HELLO WORLD!" in hex little indian
STR1			dcb		'H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D', '!', 0
STR2			dcb		'F', 'r', 'a', 'n', 'c', 'i', 's', 'c', 'o', 0
			
			;program_code_space_________________________________________________
START		adr		r0, STR1			;put parameter R0 (address) with STR1
			str		r0, [r13, #-4]!	;PUSH r0
			sub		r13, r13, #4		;reserve space for output in stack
			bl		STRLEN			;call STRLEN LR=PC and PC=STRLEN BL=Branch to Label
			ldr		r2, [r13], #4		;get result
			add		r13, r13, #4		;remove space from input in stack
			adr		r0, LENGHT1
			str		r2, [r0] 			;store count R2 (output of STRLEN) in memory
			
			adr		r0, STR2			;put parameter R0 (address) with STR1
			str		r0, [r13, #-4]!	;PUSH r0
			sub		r13, r13, #4		;reserve space for output in stack
			bl		STRLEN			;call STRLEN LR=PC and PC=STRLEN BL=Branch to Label
			ldr		r2, [r13], #4		;get result
			add		r13, r13, #4		;remove space from input in stack
			adr		r0, LENGHT2
			str		r2, [r0] 			;store count R2 (output of STRLEN) in memory
			end		;end of program, back to system
			
			;subroutines_code_space_____________________________________________
			;Frame______________________________________________________________
			;ADDR	(input) 	+2 * 4
			;SIZE	(output)	+1 * 4
			;LR		(register)	+0 * 4
STRLEN		str		r14, [r13, #-4]!	;save LR in stack
			ldr		r0, [r13, #2*4]	;get string address from Frame
			mov		r2, #-1			;r2 counter, discount end of string
STRLENLOOP	ldrb		r1, [r0], #1		;get data from memory and post increment for next
			add		r2, r2, #1		;add 1 ro counter
			cmp		r1, #0			;check if 0
			bne		STRLENLOOP
			str		r2, [r13, #1*4]	;save result in Frame
			ldr		r14, [r13], #4		;restore LR from stack
			mov		r15, r14 			;return where it was called PC=LR, should be BX LR or B LR
