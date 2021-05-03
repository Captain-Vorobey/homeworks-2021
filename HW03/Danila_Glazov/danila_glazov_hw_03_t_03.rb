# frozen_string_literal: false

DATETIME = /^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}\.\d{1}/.freeze
VALID_ACTION = /Calling core with action/.freeze

require 'time'

def durations(actions)
  valid_actions = actions.split("\n").select { |action| action.match?(VALID_ACTION) }
  durations = calc_valid_durations(valid_actions)
  return '0' if durations.empty?

  durations.count == 1 ? durations[0] : durations
end

def calc_valid_durations(valid_actions)
  duration_results = []
  prev_datetime = ''
  valid_actions.each do |action|
    current_datetime = action.match(DATETIME)[0]
    duration_results << (Time.parse(current_datetime) - Time.parse(prev_datetime)).to_s unless prev_datetime.empty?
    prev_datetime = current_datetime
  end
  duration_results
end
