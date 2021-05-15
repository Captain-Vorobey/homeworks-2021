# frozen_string_literal: true

LETTERS_REG = 'A-Za-zА-Яа-яё'
DIGITS_REG = '0-9'

def task4(string)
  res_hash = {}
  res_hash[:letters] = string.count(LETTERS_REG)
  res_hash[:digits] = string.count(DIGITS_REG)

  res_hash
end
