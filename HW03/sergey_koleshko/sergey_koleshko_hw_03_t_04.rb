def counter(str)
  hash = {}
  hash[:letters] = str.scan(/[a-zA-Z]/).length
  hash[:digits] = str.scan(/\d/).length
  hash
end

p counter('hel2!lo')
p counter('wicked .. !')
