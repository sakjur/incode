(defn list_of_numbers
    [n]
    (if (< n 2) nil (list* 2 (range 3 n 2))))

(defn multis
    ([n maxval] (multis n maxval 2 nil))
    ([n maxval x values]
    (do
        (def y (* x n))
        (if (< maxval y) 
            values
            (recur n maxval (inc x) (list* y values))))))

(defn isprime?
    ([candidates] (isprime? candidates nil))
    ([candidates done]
    (if
        (nil? (first candidates))
        done
        (recur (next (remove
            (set (multis (first candidates) (apply max candidates)))
            candidates )) (list* (first candidates) done)))))

(println (isprime? (list_of_numbers 100)))
