PROGRAMS=prog1 prog2v prog3m prog4s prog5fp

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

prog4s: prog4s.o p11l3-4s.o
	${GCC} prog4s.o p11l3-4s.o -o prog4s

prog5fp: prog5fp.o p11l3-5fp.o
	${GCC} prog5fp.o p11l3-5fp.o -o prog5fp


#C Modules
prog1.o: prog1.c prog1_asm.h
	${GCC} -c prog1.c -o prog1.o

prog2v.o: prog2v.c prog2v_asm.h
	${GCC} -c prog2v.c -o prog2v.o

prog3m.o: prog3m.c prog3m_asm.h
	${GCC} -c prog3m.c -o prog3m.o

prog4s.o: prog4s.c
	${GCC} -c prog4s.c -o prog4s.o

prog5fp.o: prog5fp.c
	${GCC} -c prog5fp.c -o prog5fp.o


#ASM Modules
p11l3-1.o: p11l3-1.S macros.S
	${AS} p11l3-1.S -o p11l3-1.o

p11l3-2v.o: p11l3-2v.S macros.S
	${AS} p11l3-2v.S -o p11l3-2v.o

p11l3-3m.o: p11l3-3m.S macros.S
	${AS} p11l3-3m.S -o p11l3-3m.o

p11l3-4s.o: p11l3-4s.S
	${AS} p11l3-4s.S -o p11l3-4s.o

p11l3-5fp.o: p11l3-5fp.S macros.S
	${AS} p11l3-5fp.S -o p11l3-5fp.o


#clean
clean:
	@echo "Removing modules (*.o) and programs" 
	@${RM} *.o ${PROGRAMS}


#rebluid
rebluid: clean all
	@echo "Modules (*.o) and progams rebuild" 


