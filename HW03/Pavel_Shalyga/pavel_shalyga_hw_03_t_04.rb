# frozen_string_literal: true

def task4(input_string)
  output_hash = {}
  output_hash[:letters] = input_string.count 'A-Za-z'
  output_hash[:digits] = input_string.count '0-9'
  output_hash
end

str1 = 'hel2!lo'
puts str1
puts task4(str1)
puts

str2 = 'wicked .. !'
puts str2
puts task4(str2)
