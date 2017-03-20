def fib(v):
    if (v < 0):
        raise Exception("Negative ints are not allowed here")
    if (v == 1 or v == 0):
        return 1

    i = 2
    n = 1
    m = 1

    while(i <= v):
        old_n = n
        n = n + m
        m = old_n
        i += 1
    
    return n

