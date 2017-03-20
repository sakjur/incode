def fn(array, left, right)
  if left < right then
    pivot = fn_part(array, left, right)
    fn(array, left, pivot-1)
    fn(array, pivot+1, right)
  end
end

def fn_part(array, left, right)
  array[right], array[left] = array[left], array[right]
  index = left
  (left..right).each do |i|
    if array[i] < array[right] then
      array[i], array[index] = array[index], array[i]
      index += 1
    end 
  end
  array[right], array[index] = array[index], array[right]
  return index
end

data = [0, 42, 256, 4, 4711, -1337]

fn(data, 0, data.length-1)
puts data
