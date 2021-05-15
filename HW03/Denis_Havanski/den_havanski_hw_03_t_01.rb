# frozen_string_literal: true

def task1(logs)
  array = logs.split("\n")
  array.each { |line| return line if line.downcase.include?('error') }
  ''
end
