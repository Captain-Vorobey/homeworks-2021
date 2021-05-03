def task_4(word)
  letters = word.count('a-zA-Z')
  digits = word.count('0-9')
  "letters: #{letters}, digits: #{digits}"
end

puts task_4('hel2!lo')
puts task_4('wicked .. !')
