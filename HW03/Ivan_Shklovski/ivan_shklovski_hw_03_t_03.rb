require 'pry'
require 'time'

logs = "2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
2018-04-23 17:19:22.4 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:19:25.9 ubuntu-xenial[14319] Debug - inside docker_handle_event
2018-04-23 17:19:48.6 ubuntu-xenial[14319] Debug - Calling core with action: event"

def task_3(content)
  final_arr = []
  arr = content.split("\n")
  arr.each do |line|
    next unless line.include?('Calling core with action:')

    final_arr << line.scan(/[0-9]+:[0-9]+:[0-9]+\.[0-9]/).first
  end
  final_arr.empty? ? 0 : difference(final_arr)
end

def difference(action)
  action.each_cons(2).map do |first, second|
    Time.parse(second) - Time.parse(first)
  end.join(',')
end

puts task_3(logs)
