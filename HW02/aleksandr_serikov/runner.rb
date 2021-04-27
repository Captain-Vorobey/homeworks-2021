require_relative 'array_refinements'

using ArrayRefinement

arr = [1,nil,'f',4]

puts "\n=========== each example =============\n"
arr.each { |e| puts e}

puts "\n=========== map example =============\n"
pp arr.map { |e| e * 3}

puts "\n=========== select example =============\n"
pp [1,3,5,7].select { |e| e < 4}
