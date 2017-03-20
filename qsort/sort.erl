-module(sort).
-export([qsort/1]).

qsort([]) ->
    [];
qsort([H | T]) ->
    Sm = [X || X <- T, X =< H],
    Lg = [X || X <- T, X > H],
    qsort(Sm) ++ [H] ++ qsort(Lg).

