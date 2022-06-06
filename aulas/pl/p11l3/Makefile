PROGRAMS=p11l3-1a p11l3-2a p11l3-2b p11l3-3a
AS=as
ASFLAGS=
GCC=gcc
RM=rm -f

all: ${PROGRAMS}

#programs
p11l3-1a: p11l3-1a.o p11l3-1a_asm.o
	${GCC} p11l3-1a.o p11l3-1a_asm.o -o p11l3-1a

p11l3-2a: p11l3-2a.o p11l3-2a_asm.o
	${GCC} p11l3-2a.o p11l3-2a_asm.o -o p11l3-2a

p11l3-2b: p11l3-2b.o p11l3-2b_asm.o
	${GCC} p11l3-2b.o p11l3-2b_asm.o -o p11l3-2b

p11l3-3a: p11l3-3a.o p11l3-3a_asm.o
	${GCC} p11l3-3a.o p11l3-3a_asm.o -o p11l3-3a


#C Modules
p11l3-1a.o: p11l3-1a.c p11l3-1a_asm.h
	${GCC} -c p11l3-1a.c -o p11l3-1a.o

p11l3-2a.o: p11l3-2a.c p11l3-2a_asm.h
	${GCC} -c p11l3-2a.c -o p11l3-2a.o

p11l3-2b.o: p11l3-2b.c p11l3-2b_asm.h
	${GCC} -c p11l3-2b.c -o p11l3-2b.o

p11l3-3a.o: p11l3-3a.c
	${GCC} -c p11l3-3a.c -o p11l3-3a.o


#ASM Modules
p11l3-1a_asm.o: p11l3-1a_asm.S
	${AS} p11l3-1a_asm.S -o p11l3-1a_asm.o

p11l3-2a_asm.o: p11l3-2a_asm.S
	${AS} p11l3-2a_asm.S -o p11l3-2a_asm.o

p11l3-2b_asm.o: p11l3-2b_asm.S
	${AS} p11l3-2b_asm.S -o p11l3-2b_asm.o

p11l3-3a_asm.o: p11l3-3a_asm.S
	${AS} p11l3-3a_asm.S -o p11l3-3a_asm.o


#clean
clean:
	@echo "Removing modules (*.o) and programs" 
	@${RM} *.o ${PROGRAMS}


#rebuild
rebuild: clean all
	@echo "Modules (*.o) and progams rebuild" 