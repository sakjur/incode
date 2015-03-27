-module(prime).
-export([map/1]).

map(N) when N < 2 ->
    [];
map(N) when N rem 2 =:= 0 ->
    map(N-1);
map(N) ->
    List = gen_list(N, 2),
    reduce([2], List, N).

gen_list(N, _) when N < 3 ->
    [];
gen_list(N, Steps) ->
    gen_list(N-Steps, Steps) ++ [N].

reduce(P, [], N) ->
    P;
reduce(P, [H | T], N) ->
    SqrH = math:pow(H, 2),
    if
        SqrH > N -> P ++ [H | T];
        true ->
            NewSet = T -- multis(H, 2, N),
            reduce(P ++ [H], NewSet, N)
    end.
    
multis(Val, M, N) when (Val*M) =< N ->
    [Val*M | multis(Val, M+1, N)];
multis(_, _, _) ->
    [].

