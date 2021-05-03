# frozen_string_literal: true

def chars_counter(str)
  counter = {}
  counter[:letters] = str.scan(/[a-zA-Z]/).count
  counter[:digits] = str.scan(/[0-9]/).count

  counter
end

chars_counter('hel2!lo')
chars_counter('wicked .. !')
