CC=clang
CFLAGS=-Wall -Wextra -std=c99 -O3
LDFLAGS=-lm

all: c.out rust.out haskell.out vala.out

c.out: deciword.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< -o $@

rust.out: decibyte.rs
	rustc $< -o $@

haskell.out: decibyte.hs
	ghc $< -o $@

vala.out: decibyte.vala
	valac --pkg gio-2.0 -X -lm $< -o $@

clean:
	rm -f c.out
	rm -f haskell.out
	rm -f decibyte.hi
	rm -f decibyte.o
	rm -f rust.out
	rm -f  vala.out
