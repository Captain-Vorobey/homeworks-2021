# frozen_string_literal: true

def task_1(data)
  str = data.split("\n")
  str.each { |line| return line if line.downcase.include?('error') }
  ''
end
