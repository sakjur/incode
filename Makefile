CC=gcc

build: fib_x86.out

fib_x86.out: fib_x86.S
	nasm -o fib_x86.o fib_x86.S -f elf64
	gcc -o fib_x86.out fib_x86.o
	rm fib_x86.o

