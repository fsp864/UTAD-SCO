PROGRAMS=p11l3-01a p11l3-01b p11l3-01c p11l3-02a
RM=rm
AS=as
ASFLAGS=#-g
GCC=gcc
LINKER=gcc#ld
LINKERFLAGS=-nostdlib
STDLIB=-lc

all: ${PROGRAMS}

#programs ----------------------------------------------------------------------
p11l3-01a: p11l3-01a.o cfunctions.o
	${LINKER} p11l3-01a.o cfunctions.o -o p11l3-01a ${LINKERFLAGS} ${STDLIB}

p11l3-01b: p11l3-01b.o cfunctions.o
	${LINKER} p11l3-01b.o cfunctions.o -o p11l3-01b ${LINKERFLAGS} ${STDLIB}

#p11l3-01c: p11l2-03c.o cfunctions.o
#	${LINKER} p11l3-01c.o cfunctions.o -o p11l3-01c ${LINKERFLAGS} ${STDLIB}
p11l3-01c: p11l3-01c.S cfunctions.c
	${LINKER} p11l3-01c.S cfunctions.c -o p11l3-01c ${LINKERFLAGS} ${STDLIB}

p11l3-02a: main.c p11l3-02a.S asmfunc.h
	${LINKER} main.c p11l3-02a.S -o p11l3-02a

#Modules -----------------------------------------------------------------------
p11l3-01a.o: p11l3-01a.S equs.S macros.S
	${AS} p11l3-01a.S -o p11l3-01a.o ${ASFLAGS}

cfunctions.o: cfunctions.c
	${GCC} cfunctions.c -c -o cfunctions.o

p11l3-01b.o: p11l3-01b.S equs.S macros.S
	${AS} p11l3-01b.S -o p11l3-01b.o ${ASFLAGS}

p11l3-01c.o: p11l3-01c.S equs.S macros.S
	${AS} p11l3-01c.S -o p11l3-01c.o ${ASFLAGS}

#p11l3-02a.o: p11l3-02a.S equs.S
#	${AS} p11l3-02a.S -o p11l3-02a.o ${ASFLAGS}

#main.o: main.c
#	${GCC} main.c -c -o main.o

#clean and rebuild -------------------------------------------------------------
clean:
	@echo Removing programs and object files
	@${RM} -v ${PROGRAMS} *.o

rebuild: clean all
	@echo Programs rebuilded
