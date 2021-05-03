# frozen_string_literal: true

def letter_digit_count(str)
  letter_count = str.count('a-zA-Z')
  digit_count = str.count('0-9')

  "letters: #{letter_count}, digits: #{digit_count}"
end

letter_digit_count('hel2!lo')
