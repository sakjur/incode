CC=clang
CFLAGS=-Wall -Wextra -std=c99 -O3
LDFLAGS=-lm

all: c.out rust.out haskell.out

c.out: deciword.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< -o $@

rust.out: decibyte.rs
	rustc $< -o $@

haskell.out: decibyte.hs
	ghc $< -o $@

clean:
	rm c.out
	rm haskell.out
	rm decibyte.hi
	rm decibyte.o
	rm rust.out
