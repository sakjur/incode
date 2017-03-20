function array_obj() {
    this.data = [0, 42, 256, 4, 4711, -1337];
}

function fn(array, offset, last) {
    if (offset < last) {
        var p = fn_part(array, offset, last);
        fn(array, offset, p-1);
        fn(array, p+1, last);
    }
}

function fn_part(array, offset, last) {
    var tmp = array.data[offset];
    array.data[offset] = array.data[last];
    array.data[last] = tmp;
    for (var i = offset; i < last; i++) {
        if (array.data[i] < array.data[last]) {
            tmp = array.data[i];
            array.data[i] = array.data[offset];
            array.data[offset] = tmp;
            offset += 1;
        }
    }
    tmp = array.data[offset];
    array.data[offset] = array.data[i];
    array.data[i] = tmp;
    return offset;
}

var array = new array_obj();
fn(array, 0, array.data.length-1);
console.log(array.data);
