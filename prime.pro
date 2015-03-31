main:-
    locateP(100, Primes),
    write('Primes: '), nl,
    reverse(Primes, L),
    write(L).


locateP(0, []):-!.

locateP(N, [N|Primes]):-
    N > 0,
    isPrime(N),
    Nx is N - 1,
    locateP(Nx, Primes).

locateP(N, Primes):-
    N > 0,
    \+isPrime(N),
    Nx is N - 1,
    locateP(Nx, Primes).


isPrime(2):- 
    true, !.

isPrime(N):- 
    \+divisible(N, 2).


divisible(N, D):-
    0 is N mod D,
    !.

divisible(N, D):-
    N > D+1,
    divisible(N, D+1).
