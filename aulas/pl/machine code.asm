		;		bal		BIN
START	mov		r0, #0x12		;0x1200a0e3
		mov		r1, #0x22		;0x2210a0e3
		add		r0, r0, r1	;0x010080e0
		end
		
BIN		dcd		0x1200a0e3, 0x2210a0e3, 0x010080e0
