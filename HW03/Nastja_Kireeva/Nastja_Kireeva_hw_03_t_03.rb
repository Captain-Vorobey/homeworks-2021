require 'time'
TIMESTAMP = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/.freeze

def task3(logs)
  lines = logs.split(/\n/)
  events = lines.select { |line| line.include?('Calling') }.map { |line| line[TIMESTAMP] }
  events.empty? ? 0 : calculate_diff(events)
end

def calculate_diff(events)
  diff = []
  events.each_cons(2) do |previous_event, next_event|
    diff << Time.parse(next_event) - Time.parse(previous_event)
  end
  diff.join(',')
end
