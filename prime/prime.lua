-- prime number generator

function getprimes (n)
    if n < 2 then
        primes = {}
    else
        primes = {2}
        candidates = {}
        for i=3,n,2 do
            table.insert(candidates, i)
        end
        while candidates[1] ~= nil do
            table.insert(primes, candidates[1])
            remove_array = multiples(candidates[1], n)
            counter = 1
            while remove_array[1] ~= nil and candidates[counter] ~= nil do
                if remove_array[1] < candidates[counter] then
                    table.remove(remove_array, 1)
                elseif remove_array[1] == candidates[counter] then
                    table.remove(candidates, counter)
                else
                    counter = counter + 1
                end
            end
        end
    end
    return primes
end

function multiples (n, max)
    i = 1
    m = {}
    while i*n <= max do
        table.insert(m, i*n)
        i = i + 1
    end
    return m
end

primes = getprimes(100)
for i,v in ipairs(primes) do
    print(v)
end

