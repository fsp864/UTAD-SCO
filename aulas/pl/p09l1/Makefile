PROGRAMS=p09l1-01 p09l1-02 p09l1-02a p09l1-02b
MODULES=
AS=as
ASFLAGS=
GCC=gcc
GCCFLAGS="-nostdlib"

all: ${PROGRAMS} ${MODULES}

#programs
p09l1-01: p09l1-01.o
	${GCC} p09l1-01.o -o p09l1-01 ${GCCFLAGS}

p09l1-02: p09l1-02.o
	${GCC} p09l1-02.o -o p09l1-02 ${GCCFLAGS}

p09l1-02a: p09l1-02a.o
	${GCC} p09l1-02a.o -o p09l1-02a ${GCCFLAGS}

p09l1-02b: p09l1-02b.o functions.o
	${GCC} p09l1-02b.o functions.o -o p09l1-02b ${GCCFLAGS}

#Modules
p09l1-01.o: p09l1-01.S
	${AS} p09l1-01.S -o p09l1-01.o ${ASFLAGS}

p09l1-02.o: p09l1-02.S
	${AS} p09l1-02.S -o p09l1-02.o ${ASFLAGS}

p09l1-02a.o: p09l1-02a.S
	${AS} p09l1-02a.S -o p09l1-02a.o ${ASFLAGS}

p09l1-02b.o: p09l1-02b.S
	${AS} p09l1-02b.S -o p09l1-02b.o ${ASFLAGS}

functions.o: functions.S
	${AS} functions.S -o functions.o ${ASFLAGS}

clean:
	rm -v ${PROGRAMS} *.o
