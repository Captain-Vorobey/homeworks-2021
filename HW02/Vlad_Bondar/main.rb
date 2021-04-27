require_relative 'my_enumerable'

using MyEnumerable

ms = [1,2,3,4,5,6,7]

puts ms.my_each { |item| item }
puts ms.my_map { |item| item+10 }
puts ms.my_select { |item| item > 4 }
