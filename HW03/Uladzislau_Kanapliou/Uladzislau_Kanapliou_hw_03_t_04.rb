def task4(string)
  count = {}
  count [:letters] = string.count('a-zA-Z')
  count[:numbers] = string.count('0-9')
  count
end
