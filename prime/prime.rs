fn findprimes(n: i64) -> Vec<i64> {
	let candidates: Vec<i64> = (2..n).collect();
	return reduce(candidates, vec![]);
}

fn reduce(mut candidates: Vec<i64>, mut finalists: Vec<i64>) -> Vec<i64> {
	if candidates.is_empty() {
		return finalists;
	} else {
		let first = *candidates.first().unwrap();
		let mut done = false;
		let mut i = 0;
		finalists.push(first);
		while !done {
			if i >= candidates.len() {
				done = true;
			} else {
				let value = *candidates.get(i).unwrap();
				if value % first == 0 && value != first
				{
					candidates.remove(i);
				}
			}
			i = i + 1;
		}
		candidates.remove(0);
		return reduce(candidates, finalists);
	};
}

fn main() {
	let primes = findprimes(100);
	for prime in primes {
		print!("{}, ", prime);
	}
}