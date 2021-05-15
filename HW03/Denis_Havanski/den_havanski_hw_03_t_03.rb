# frozen_string_literal: true

require 'time'

TIME_REG = /^20[0-9]{2}-[0-1]\d-[0-3]\d\s[0-2]\d:[0-5]\d:[0-5]\d\.[0-9]/.freeze

def create_time_array(array)
  time_array = []
  array.each do |line|
    next unless line.include? 'Calling core'
    timestring = line.slice(TIME_REG)
    timestamp = Time.parse(timestring)
    time_array << timestamp
  end
  time_array
end

def create_arr_of_time_diff(time_array)
  result = []
  time_array.each_cons(2) do |el|
    diff = el[1] - el[0]
    result << diff.to_s
  end
  result
end

def task3(logs)
  array = logs.split("\n")
  time_array = create_time_array(array)
  result = create_arr_of_time_diff(time_array)
  if result.size == 1
    result[0]
  elsif result.empty?
    '0'
  else
    result
  end
end
