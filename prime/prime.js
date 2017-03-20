function locatep(n) {
    var arr = [];
    var p = [2]

    if (n <= 2) {
        for(i = 0; i < n; i++) {
            arr.push(i)
        }
        return arr;
    }

    for(i = 3; i < n; i += 2) {
        arr.push(i)
    }

    while(arr.length > 1 && Math.pow(arr[0], 2) <= n) {
        var num = arr.shift()
        p.push(num)
        red(num, arr)
    }

    return p.concat(arr)
}

function red(k, arr) {
    var i = 2
    while (k*i <= arr[arr.length - 1]) {
        var index = arr.indexOf(k*i)
        if (index > -1) {
            arr.splice(index, 1)
        }
        i += 1
    }

    return arr
}

console.log(locatep(100))
