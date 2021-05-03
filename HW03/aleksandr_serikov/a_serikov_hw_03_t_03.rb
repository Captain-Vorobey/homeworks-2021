# frozen_string_literal: true

require 'time'

def task3(logs)
  correct_lines = logs.split("\n").select { |line| line[/Calling core with action:/] }
  times = correct_lines.map do |log|
    log[/ ubuntu-xenial/]
    Time.parse(Regexp.last_match.pre_match)
  end
  result = calculate_time_duration(times)

  result.any? ? result : '0'
end

def calculate_time_duration(times)
  result = []
  times.each_with_index { |time, i| result << (times[i + 1] - time).to_s if times[i + 1] }
  result
end
