PROGRAMS=p10l2-01a p10l2-01b p10l2-01c p10l2-02a
RM=rm
AS=as
ASFLAGS=#-g
GCC=gcc
LINKER=gcc#ld
LINKERFLAGS=-nostdlib
STDLIB=-lc


all: ${PROGRAMS}

#programs ----------------------------------------------------------------------
p10l2-01a: p10l2-01a.o cfunctions.o
	${LINKER} p10l2-01a.o cfunctions.o -o p10l2-01a ${LINKERFLAGS} ${STDLIB}

p10l2-01b: p10l2-01b.o cfunctions.o
	${LINKER} p10l2-01b.o cfunctions.o -o p10l2-01b ${LINKERFLAGS} ${STDLIB}

#p10l2-01c: p10l2-01c.o cfunctions.o
#	${LINKER} p10l2-01c.o cfunctions.o -o p10l2-01c ${LINKERFLAGS} ${STDLIB}
p10l2-01c: p10l2-01c.S cfunctions.c
	${LINKER} p10l2-01c.S cfunctions.c -o p10l2-01c ${LINKERFLAGS} ${STDLIB}

p10l2-02a: main.c p10l2-02a.S asmfunc.h
	${LINKER} main.c p10l2-02a.S -o p10l2-02a

#Modules -----------------------------------------------------------------------
p10l2-01a.o: p10l2-01a.S equs.S macros.S
	${AS} p10l2-01a.S -o p10l2-01a.o ${ASFLAGS}

cfunctions.o: cfunctions.c
	${GCC} cfunctions.c -c -o cfunctions.o

p10l2-01b.o: p10l2-01b.S equs.S macros.S
	${AS} p10l2-01b.S -o p10l2-01b.o ${ASFLAGS}

p10l2-01c.o: p10l2-01c.S equs.S macros.S
	${AS} p10l2-01c.S -o p10l2-01c.o ${ASFLAGS}

#p10l2-02a.o: p10l2-02a.S equs.S
#	${AS} p10l2-02a.S -o p10l2-02a.o ${ASFLAGS}

#main.o: main.c
#	${GCC} main.c -c -o main.o

#clean and rebuild -------------------------------------------------------------
clean:
	@echo Removing programs and object files
	@${RM} -v ${PROGRAMS} *.o

rebuild: clean all
	@echo Programs rebuilded
