# frozen_string_literal: false

VALID_FORMAT = /^\d{2}\.\d{1}\.\d{3}\.\d{3}\s-\s-\s.+$/.freeze
DATA = %r{\d{1,2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d{4}}.freeze
FROM = /^\d{1,2}\.\d{1}\.\d{1,3}\.\d{1,3}/.freeze
TO = %r{"\w+\s(.*)\s\w+/\d{1}\.\d{1}}.freeze

def format_logs(logs_str)
  logs_str.split("\n").select { |log| log.match?(VALID_FORMAT) }
          .map do |log|
    data = log.match(DATA)
    from = log.match(FROM)
    to = log.match(TO)[1].upcase

    "#{data} FROM: #{from} TO: #{to}"
  end
end
