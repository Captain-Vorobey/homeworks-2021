require_relative 'my_enumerables'
include MyEnumerables
arr = [2, 3, 2, 5]
arr.my_each { |element| puts element * 2 }
