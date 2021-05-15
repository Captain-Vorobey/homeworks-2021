# frozen_string_literal: true

def task4(text)
  output = { letters: 0, digits: 0 }
  text.each_char do |char|
    output[:letters] += 1 if ('a'..'z').include? char.downcase
    output[:digits] += 1 if ('0'..'9').include? char
  end
  output
end
