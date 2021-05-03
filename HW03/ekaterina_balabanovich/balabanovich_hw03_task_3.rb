# frozen_string_literal: true
require 'time'

logs = <<~LOGS
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
LOGS

TIME_REGEX = %r{\d{4}(-\d{2}){2}[[:space:]](\d{2}:){2}\d{2}[[:punct:]]\d}.freeze

def duration_count(logs)
  return 0 if logs.lines.count <= 1

  time_differences = []
  logs.each_line.with_index do |line, i|
    break if i >= logs.lines.count - 1

    current_event_time = TIME_REGEX.match(line).to_s
    next_event_time = TIME_REGEX.match(logs.lines[i + 1]).to_s
    time_differences << Time.parse(next_event_time) - Time.parse(current_event_time)
  end
  time_differences
end

def extract_core_log(logs)
  logs.each_line.select { |line| line.downcase.match('calling core') }.join
end

duration_count(extract_core_log(logs))
