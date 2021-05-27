def find_error_in_text(text)
  array_text = text.split("\n")
  array_text.each { |string| return string if string.downcase.include?('error') }
  " "
end
