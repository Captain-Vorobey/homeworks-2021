# frozen_string_literal: true

def task1(logs)
  lines = logs.split("\n")
  lines.each { |line| return line if line.downcase.include?('error') }

  ''
end
