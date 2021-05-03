require_relative('my_array')

arr = [1, 2, 3, 4, 5] # array for default iterators
my_arr = MyArray.new([1, 2, 3, 4, 5]) # array of class MyArray for my methods

# default select
select_arr = arr.select { |num| num.even? } #=> [2, 4]
p "arr of default class Array after select: #{select_arr}"

# my select
my_select_arr = MyArray.new(my_arr.select do |el| #=> [2, 4]
  el.even?
end)
p my_select_arr

p '-------------------'

# default each
arr = [1, 2, 3, 4, 5]
arr.each { |el| el += 100 }
p "arr of default class Array after each: #{arr}"

# my each
my_arr.each do |el|
  el += 100
end

p my_arr

p '-------------------'

# default map
arr = [1, 2, 3, 4, 5]
map_arr = arr.map { |el| el *= 100 }
p "arr of default class Array after map: #{map_arr}"

# my map
my_map_arr = MyArray.new(my_arr.map do |el|
  el *= 100
end)
p my_map_arr
