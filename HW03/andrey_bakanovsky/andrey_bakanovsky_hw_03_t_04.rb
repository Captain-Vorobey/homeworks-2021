# frozen_string_literal: true

def task_4(text)
  reg_exp_l = /[^a-zA-Z]/
  reg_exp_d = /[^0-9]/
  letters_count = text.gsub(reg_exp_l, '').length
  digits_count  = text.gsub(reg_exp_d, '').length
  if digits_count.zero?
    puts "#{letters_count} --- {letters: #{letters_count}, digits: #{digits_count}}"
  else
    puts "{letters: #{letters_count}, digits: #{digits_count}}"
  end
end

task_4('hel2!lo')
task_4('wicked .. !')
