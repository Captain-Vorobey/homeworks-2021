# frozen_string_literal: true

require 'time'

FORMAT = /Calling core with action:/.freeze
DATE = /\d+-\d+-\d+ \d+:\d+:\d+.\d*/.freeze

def task3(input_string)
  lines_array = input_string.split("\n")
  time_array = lines_array.select { |line| line.scan(FORMAT)[0] }.map do |line|
    Time.parse(line.scan(DATE)[0])
  end
  output_array = calculate_time(time_array)
  output_array.empty? ? '0' : output_array
end

def calculate_time(time_array)
  result_array = []
  time_array.each_index do |index|
    duration = time_array[index + 1] - time_array[index] if time_array[index + 1]
    result_array << duration.to_s unless duration.nil?
  end
  result_array
end

log = '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
2018-04-23 17:19:38.5 ubuntu-xenial[14319] Debug - Calling core with action: messages'

puts log
puts
print task3(log)
