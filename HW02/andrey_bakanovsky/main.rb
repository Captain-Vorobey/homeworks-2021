# frozen_string_literal: true

require_relative 'array_refine'
using ArrayRefine
puts a = [1, 2, 3, 4]
puts 'my_map:'
b = a.my_map { |x| x**3 }
puts b
puts 'my_select:'
puts a.my_select(&:even?)
puts 'my_each:'
a.my_each { |y| puts y * 2 }
