			;associeted_memory_data_space_______________________________________
STRLEN_ADDR	FILL		4
STRLEN_SIZE	FILL		4
			;program_data_space_________________________________________________
LENGHT1		fill		4
LENGHT2		fill		4
STR1			dcb		'H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D', '!', 0
STR2			dcb		'F', 'r', 'a', 'n', 'c', 'i', 's', 'c', 'o', 0
			
			;program_code_space_________________________________________________
START		adr 		r0, STR1			;address STR1 in R0 
			adr		r1, STRLEN_ADDR	;R1 with address STRLEN_ADDR
			str		r0, [r1]			;put parameter STR1 in STRLEN_ADDR
			bl		STRLEN			;call STRLEN LR=PC and PC=STRLEN BL=Branch to Label
			adr		r0, STRLEN_SIZE	;R0 with address STRLEN_SIZE
			ldr		r1, [r0]			;get size to r1
			adr		r0, LENGHT1		;R0 with address LENGHT1
			str 		r1, [r0]			;save size
			
			adr 		r0, STR2			;address STR2 in R0 
			adr		r1, STRLEN_ADDR	;R1 with address STRLEN_ADDR
			str		r0, [r1]			;put parameter STR2 in STRLEN_ADDR
			bl		STRLEN			;call STRLEN LR=PC and PC=STRLEN BL=Branch to Label
			adr		r0, STRLEN_SIZE	;R0 with address STRLEN_SIZE
			ldr		r1, [r0]			;get size to r1
			adr		r0, LENGHT2		;R0 with address LENGHT2
			str 		r1, [r0]			;save size

			end		;end of program, back to system
			
			;subroutines_code_space_____________________________________________
STRLEN		adr		r1, STRLEN_ADDR	;get string address from associeted memory
			ldr		r0, [r1]			
			mov		r2, #-1			;r2 counter, discount end of string
STRLENLOOP	ldrb		r1, [r0], #1		;get data from memory and post increment for next
			add		r2, r2, #1		;add 1 to counter
			cmp		r1, #0			;check if 0
			bne		STRLENLOOP
			adr		r1, STRLEN_SIZE	;set string size in associeted memory
			str		r2, [r1]			
			mov		r15, r14 			;return where it was called PC=LR, should be BX LR or B LR
