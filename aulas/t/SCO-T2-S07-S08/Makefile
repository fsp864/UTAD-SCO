PROGRAMS=prog1 prog2v prog3m

AS=as
ASFLAGS=
GCC=gcc
GCCLINKERFLAGS=-nostdlib -lc
RM=rm -f

all: ${PROGRAMS}

#programs
prog1: prog1.o p11l3-1.o
	${GCC} prog1.o p11l3-1.o -o prog1

prog2v: prog2v.o p11l3-2v.o
	${GCC} prog2v.o p11l3-2v.o -o prog2v

prog3m: prog3m.o p11l3-3m.o
	${GCC} prog3m.o p11l3-3m.o -o prog3m

#C Modules
prog1.o: prog1.c prog1_asm.h
	${GCC} -c prog1.c -o prog1.o

prog2v.o: prog2v.c prog2v_asm.h
	${GCC} -c prog2v.c -o prog2v.o

prog3m.o: prog3m.c prog3m_asm.h
	${GCC} -c prog3m.c -o prog3m.o

#ASM Modules
p11l3-1.o: p11l3-1.S macros.S
	${AS} p11l3-1.S -o p11l3-1.o

p11l3-2v.o: p11l3-2v.S macros.S
	${AS} p11l3-2v.S -o p11l3-2v.o

p11l3-3m.o: p11l3-3m.S macros.S
	${AS} p11l3-3m.S -o p11l3-3m.o

#clean
clean:
	@echo "Removing modules (*.o) and programs" 
	@${RM} *.o ${PROGRAMS}

#rebluid
rebluid: clean all
	@echo "Modules (*.o) and progams rebuild" 


