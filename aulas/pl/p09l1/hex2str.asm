;test fot hex2str in VisUAL Emulator
start	adr		r2, value
		ldr		r0, [r2]
		
TOSTR	ldr		r4, =h2sbufend
		ldr		r2, =0x0000000f
		mov		r3, #8
LOOP		and		r1, r0, r2
		cmp		r1, #10
		blt		digit
		add		r1, r1, #7	;offset from '9' to 'A'
digit	add		r1, r1, #'0'	;offset to '0'
		strb		r1, [r4, #-1]!
		mov		r0, r0, asr #4
		subs		r3, r3, #1
		bne		LOOP
		end
		
value	dcd		0x1234fedc
h2sbuffer	fill		2 * 4
h2sbufend	dcd	0
		
