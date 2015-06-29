multiples       :: Integer -> Integer -> [Integer]
multiples n max = [n, 2*n..max]

remove_from_list :: [Integer] -> [Integer] -> [Integer] -> [Integer]
remove_from_list target removal_array rv
    | null target || null removal_array =
        rv ++ target
    | head target > head removal_array =
        remove_from_list target (tail removal_array) rv
    | head target == head removal_array =
        remove_from_list (tail target) (tail removal_array) rv
    | otherwise =
        remove_from_list (tail target) removal_array (rv ++ [head target])

findprimes :: Integer -> [Integer]
findprimes n 
    | n < 2 = []
    | otherwise =
        2:(findprimes' [3,5..n] [])
    
findprimes' :: [Integer] -> [Integer] -> [Integer]
findprimes' candidates primes
    | null candidates = primes
    | otherwise =
        findprimes'
            (remove_from_list
                candidates
                (multiples (head candidates) (last candidates))
                [])
            (primes ++ [head candidates])

main = print (findprimes 100)

