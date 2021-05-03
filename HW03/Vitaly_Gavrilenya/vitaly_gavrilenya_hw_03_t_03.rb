# frozen_string_literal: true

require 'time'

log = '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'

def sort_log(log)
  log.split("\n").select { |line| line.downcase.include?('calling') }
end

def parse_time(log)
  log.map { |line| Time.parse(line) }
end

def operation_duration(parsed_time)
  return '0' if parsed_time.length < 2
  return (parsed_time[1] - parsed_time[0]).to_s if parsed_time.length == 2

  parsed_time.each_cons(2).map { |a, b| (b - a).to_s }
end

sorted_log = sort_log(log)
parsed_time = parse_time(sorted_log)
operation_duration(parsed_time)
