array = [0, 42, 256, 4, 4711, -1337]

def fn(array, offset, last):
    if (offset < last):
        p = fn_part(array, offset, last)
        fn(array, offset, p-1)
        fn(array, p+1, last)

def fn_part(array, offset, last):
    array[last], array[offset] = array[offset], array[last]
    for i in xrange(offset, last+1):
        if array[i] < array[last]:
            array[i], array[offset] = array[offset], array[i] 
            offset += 1
    array[last], array[offset] = array[offset], array[last]
    return offset

fn(array, 0, len(array)-1)
print(array)
    
