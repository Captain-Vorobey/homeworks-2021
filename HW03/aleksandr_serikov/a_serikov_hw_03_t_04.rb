# frozen_string_literal: true

def task4(string)
  result = {}
  result[:letters] = string.split('').count { |e| e[/[a-z]+/i] }
  result[:digits] = string.split('').count { |e| e[/\d+/] }
  result
end
