@this is a comment

@check system calls https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md

@dot means it's a directive for the aasembler
.global         _start					@export the label _start for the program entry

.section        .text					@section .text it's for the code
_start:         mov r7, #4				@system call "write" R7=4
                mov r0, #1				@R0 wuth file descriptor, 1 for standard output
                ldr r1, =msg			@R1 with message address
                mov r2, #13				@R2 wuth message length
                swi 0					@call system handler to write msg

exit:           mov r7, #1				@system call "exit" R7=1
                mov r0, #0				@R0	exit value, 0 is for NORMAL
				swi 0					@call system handler to exut program

.section        .data					@section .data it's for the variables
msg:            .ascii "Hello ARM!!!\n"	@data with message

