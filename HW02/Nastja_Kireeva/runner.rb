require_relative 'array_module'

using ArrayModule

array = [1, 2, 3, 4, 5, 6]

array.my_each { |element| p element }
p array.my_map { |element| element * 3 }
p array.my_select(&:odd?)
p array.my_reject(&:odd?)
p array.my_empty?
p array.my_count { |element| (element % 3).zero? }
