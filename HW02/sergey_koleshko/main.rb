# frozen_string_literal: true

require './MyEnumerable'

using MyEnumerable
a = %w[a b c]

puts 'Using my each:'
a.my_each do |i|
  puts i * 2
end
puts 'Using my times:'
5.my_times { |i| puts i }

puts 'Using my map:'
b = a.my_map { |i| i * 2 }
puts b

puts 'Using my select:'
c = a.my_select { |i| i != 'a' }
puts c

puts 'Using upto:'
5.my_upto(10) { |i| puts i }
