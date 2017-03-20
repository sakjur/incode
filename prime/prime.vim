function GetPrimes(n)
    let c = 3
    let primes = [2]
    let candidates = []

    while c <= a:n
        call add(candidates, c)
        let c += 2
    endwhile
    while 1 <= len(candidates)
        call add(primes, candidates[0])
        let multiples = Multiples(candidates[0], a:n)
        let c = 0
        while c <= len(candidates)-1 && 1 <= len(multiples)
            " This will eventuallyterminate, because either the counter will 
            " increase, or either of the list sizes will decrease
            if candidates[c] == multiples[0] 
                call remove(candidates, c)
            elseif candidates[c] > multiples[0]
                call remove(multiples, 0)
            else
                let c += 1
            endif
        endwhile
    endwhile
    echo primes
endfunction

function Multiples(n, max)
    let multiples = [a:n]
    let c = 2
    while c*a:n <= a:max
        let val = c*a:n
        call add(multiples, val)
        let c += 1
    endwhile
    return multiples
endfunction
