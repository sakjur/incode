CC=clang
CFLAGS=-Wall -Wextra -std=c99 -O3
LDFLAGS=-lm

all: c.out rust.out

c.out: deciword.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< -o $@

rust.out: decibyte.rs
	rustc $< -o $@

clean:
	rm deciword.out
