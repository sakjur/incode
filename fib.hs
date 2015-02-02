fib :: Int -> Int 
fib 0 =
    1
fib n =
    fib' n 1 0

fib' :: Int -> Int -> Int -> Int
fib' 1 prev prevprev =
    prev+prevprev
fib' n prev prevprev =
    fib' (n-1) (prev+prevprev) prev

