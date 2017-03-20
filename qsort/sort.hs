fn :: Ord a => [a] -> [a]
fn []       = []
fn (p:xs)   = (fn lesser) ++ [p] ++ (fn greater)
    where
        lesser = filter (< p) xs
        greater = filter (>= p) xs

main =
    print (fn [0, 42, 256, 4, 4711, -1337])

