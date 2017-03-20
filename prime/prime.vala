void main(string[] args) {
    foreach (int prime in find_primes(100)) {
        stdout.printf(prime.to_string() + "\n");
    }
}

int[] find_primes(int n) {
    if (n < 2) {
        return {};
    }
    
    int[] candidates = {2};
    for (int i = 3; i <= n; i += 2) {
        candidates += i;
    }
    int[] primes = remove_composites(candidates);
    return primes;
}

int[] remove_composites(int[] candidates) {
    int[] primes = {};  
    foreach (int candidate in candidates) {
        if (candidate == 0) // Composites are marked with 0
            continue;
        for (int i = 0; i <= candidates.length-1; i++) {
            if (candidates[i] % candidate == 0)
                candidates[i] = 0;
        }
        primes += candidate;
    }
    return primes;
}

