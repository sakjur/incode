def fib(n)
    if n == 0 then
        return 1
    end
    
    i    = 1
    curr = 1
    prev = 0

    (i .. n).each do
        tmp  = curr
        curr = curr + prev
        prev = tmp
    end
    
    return curr
end

puts fib 13

