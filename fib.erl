-module(fib).

-export([fib/1]).

fib(N) when N == 1; N =:= 0 -> 1;
fib(N) -> fib(N-2, 1, 1).

fib(0, Prev, Prevprev) -> Prev + Prevprev;
fib(N, Prev, Prevprev) ->
    fib(N-1, Prev+Prevprev, Prev).

