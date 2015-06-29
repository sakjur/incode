generatelist    :: Integer -> [Integer]
generatelist n
    | n >= 2 = 2:[3,5..n]
    | n <  2 = []

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
findprimes n =
    findprimes' n (generatelist n) []
    
findprimes' :: Integer -> [Integer] -> [Integer] -> [Integer]
findprimes' n candidates primes
    | null candidates = primes
    | otherwise =
        findprimes'
            n
            (remove_from_list
                candidates
                (multiples (head candidates) n)
                [])
            (primes ++ [head candidates])

