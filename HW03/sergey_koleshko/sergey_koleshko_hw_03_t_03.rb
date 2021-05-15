logs = '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'

TEMPLATE_TIME = /\d{0,23}:\d{0,60}:\d{0,60}\.\d/.freeze
SECOND_TIME = /\d{0,60}\.\d/.freeze
MINUTE_TIME = /:\d{0,60}:/.freeze
HOUR_TIME = /^\d{0,60}/.freeze

def difference_time(logs)
  times = logs.each_line.select { |line| line.match(/Calling core/) }.map do |time|
    time.scan(HOUR_TIME)[0].to_f * 3600 + time.scan(MINUTE_TIME)[0].delete(':').to_f * 60 + time.scan(SECOND_TIME)[0].to_f
  end
  return ['0'] if times.length < 2

  diff(times)
end

def diff(time)
  temp = []
  for i in 0...time.length - 1
    temp << (time[i + 1] - time[i]).round(1).to_s
  end
  temp
end

difference_time(logs)
