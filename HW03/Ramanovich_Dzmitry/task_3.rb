# frozen_string_literal: true

require 'time'
TIME = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task_3(logs)
  lines = logs.split(/\n/)
  str = lines.select { |line| line.include?('Calling') }
  str.map { |line| line[TIME] }
  str.empty? ? 0 : method(str)
end

def method(str)
  str.each_cons(2).map { |str_one, str_two| Time.parse(str_two) - Time.parse(str_one) }.join(',')
end
