fib :: Int -> Integer
fib 0 =
    1
fib n =
    fib' n 1 0

fib' :: Int -> Integer -> Integer -> Integer
fib' 1 prev prevprev =
    prev+prevprev
fib' n prev prevprev =
    fib' (n-1) (prev+prevprev) prev

