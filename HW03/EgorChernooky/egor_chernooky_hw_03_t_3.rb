# frozen_string_literal: true

require 'time'
HOUR_IN_SEC = 3600
MIN_IN_SEC = 60
REGEXP = /^\d{4}-\d{2}-\d{2}\ \d{2}:\d{2}:\d{2}\.\d{1}/.freeze

logs =
  '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'

def task3(logs)
  date = []
  sorted_logs = logs.split("\n").select { |line| line.downcase.include?('calling core with action') }
  sorted_logs.each do |log|
    date << log.scan(REGEXP).join
  end

  output_array = []
  (date.length - 1).times do |i|
    if date.length > 2
      first_process = date[i].scan(REGEXP).join
      second_process = date[i + 1].scan(REGEXP).join
      output_array << (Time.parse(second_process) - Time.parse(first_process)).to_s
    else
      first_process = date[i].scan(REGEXP).join
      second_process = date[i + 1].scan(REGEXP).join
      output_array << "#{second_process} - #{first_process} = #{Time.parse(second_process) - Time.parse(first_process)}"
    end
  end
  output_array
end

p task3(logs)
