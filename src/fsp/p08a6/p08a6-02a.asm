			;program_data_space_________________________________________________
RLENIN		fill		4
RLENOUT		fill		4
			
LENGTH1		fill		4
			;STR1	dcd		0x4c4c4548, 0x4f57204f, 0x2144524c, 0x00000000 ;string "HELLO WORLD!" in hex little indian
STR1			dcb		'H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D', '!', 0
			
			;program_code_space_________________________________________________
START		adr		r0, RLENIN
			adr		r1, STR1	;parameter R1 (address)
			str		r1, [r0]	;put parameter
			bl		STRLEN	;call STRLEN LR=PC and PC=STRLEN BL=Branch to Label
			adr		r0, RLENOUT
			ldr		r1, [r0]
			adr		r0, LENGTH1
			str		r1, [r0] 	;store count R2 (output of STRLEN) in memory
			
			end		;end of program, back to system
			
			;subroutines_code_space_____________________________________________
STRLEN		adr		r0, RLENIN
			ldr		r0, [r0]
			mov		r2, #0		;put count to 0 (can be -1 for end o string)
STRLENLOOP	ldrb		r1, [r0], #1	;get data from memory and post increment for next
			add		r2, r2, #1	;count + 1
			cmp		r1, #0		;check if 0
			bne		STRLENLOOP
			sub		r2,r2, #1	;remove counting for \0 (end of string)
			adr		r0, RLENOUT
			str		r2, [r0]
			mov		r15, r14 	;return to where it was called PC=LR, should be BX LR or B LR
