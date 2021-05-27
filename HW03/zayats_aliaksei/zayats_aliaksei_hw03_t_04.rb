DIGIT = /[0-9]/
LETTER = /[a-zA-Z]/

def symbol_count(string)
  letters = 0
  digits = 0
  string.chars.each do |symbol|
    digits += 1 if symbol.match(DIGIT)
    letters += 1 if symbol.match(LETTER)
  end
  { 'letters': letters, 'digits': digits }
end
