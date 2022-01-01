@macros

@push return--------------------------------------------------------------------
.macro	return 
		bx lr
.endm

@call macro---------------------------------------------------------------------
.macro	call address
		push lr
		bl  \address
		pop lr
.endm

@push macro---------------------------------------------------------------------
.macro	push reg
		str \reg, [sp, #-1*4]!
.endm

@pop macro----------------------------------------------------------------------
.macro	pop reg
		ldr \reg, [sp], #+1*4
.endm

@pushfuncregs macro-------------------------------------------------------------
.macro	pushfuncregs
		push lr
		push r11
		push r10
		push r9
		push r8
		push r7
		push r6
		push r5
		push r4
.endm

@popfuncregs macro--------------------------------------------------------------
.macro	popfuncregs
		pop r4
		pop r5
		pop r6
		pop r7
		pop r8
		pop r9
		pop r10
		pop r11
		pop lr
.endm

