		;SCO-P03A1-02:	load values to regiters and add
		;content:	MOV, AND, valuesin binary and hexadecimnal
		
start	mov		r0, #0b10101010		;original value in R0
		and		r1, r0, #0b11110000		;change upper 4 bits
		orr		r2, r0, #0xf0			;0xf0 same value as 0x1111000
		eor		r3, r0, #0b11110000		;change upper 4 bits
		end
