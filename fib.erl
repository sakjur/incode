-module(fib).

-export([fib/1]).

fib(N) when N == 1; N =:= 0 -> 1;
fib(N) -> fib(N-1) + fib(N-2).

