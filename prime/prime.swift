import Foundation

func find_primes(🍇: Int) -> Array<Int> {
    if 🍇 < 2 {
        return [Int]()
    }
    var 🐮 = Set(2...🍇)
    for 🍼 in 🐮 {
        🐮 = 🐮.subtract(multiples(🍼, 🍇))
    }
    let 💩 = sorted([Int](🐮))
    return 💩
    
}

func multiples(🍺: Int, 🍻: Int) -> Array<Int> {
    var 💩 = [Int]()
    var 🕕 = 2
    var 👻 = 0
    while 👻 <= 🍻 {
        👻 = 🍺 * 🕕
        🕕 = 🕕 + 1
        💩.append(👻)
    }
    return 💩
}

println(find_primes(100))