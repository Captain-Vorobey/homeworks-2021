# frozen_string_literal: true

DATE_REGEXP = /(?<=\[)[^]]+(?=\])/.freeze
FROM_REGEXP = /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}/.freeze
TO_REGEXP = /(?<=")[^]]+(?=")/.freeze

def task2(logs)
  lines = logs.split("\n")
  lines.map.with_object([]) do |line, arr|
    date = line.scan(DATE_REGEXP).first
    next if date.nil?

    from = line.scan(FROM_REGEXP).first
    to = line.scan(TO_REGEXP).first.split[1].upcase

    arr << "#{date} FROM: #{from} TO: #{to}"
  end
end
