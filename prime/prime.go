package main

import "fmt"
import "sort"

func main() {
	for _, prime := range find_primes(100) {
		fmt.Printf("%d\n", prime)
	}
}

func find_primes(n int) []int {
	if n < 2 {
		return []int{}
	}

	candidates := []int{}
	primes := []int{2}
	for i := 3; i <= n; i += 2 {
		candidates = append(candidates, i)
	}

	for i := 0; len(candidates) > 0; i = i {
		primes = append(primes, candidates[i])
		for _, multiple := range multiples(candidates[i], n) {
			pos := sort.SearchInts(candidates, multiple)
			if pos != len(candidates) && candidates[pos] == multiple {
				candidates = append(candidates[:pos], candidates[pos+1:]...)
			}
		}
	}

	return primes
}

func multiples(n, max int) []int {
	multiples := []int{}
	for i := 1; i*n <= max; i++ {
		multiples = append(multiples, i*n)
	}
	return multiples
}
