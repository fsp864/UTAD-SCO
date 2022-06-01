@macros
@call macro---------------------------------------------------------------------
.macro	call address
	push lr
	bl  \address
	pop lr
.endm
@return macro-------------------------------------------------------------------
.macro	return
	bx lr
.endm
@push macro---------------------------------------------------------------------
.macro	push reg
	str \reg, [sp, #-1*4]!
.endm
@pop macro----------------------------------------------------------------------
.macro	pop reg
	ldr \reg, [sp], #+1*4
.endm
