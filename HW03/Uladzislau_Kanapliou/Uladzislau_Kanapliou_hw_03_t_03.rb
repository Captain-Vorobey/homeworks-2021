# frozen_string_literal: true

require 'date'

EXP_FIND = %r{/*.+\bCalling core/*.+}.freeze

def task3(logs)
  return_array = []

  if logs.match(EXP_FIND)
    raw_split_log_array = logs.split("\n")

    datetimes = raw_split_log_array.select { |line| line.match(EXP_FIND) }.map do |line|
      DateTime.parse(line)
    end

    (0...datetimes.size - 1).each do |i|
      return_array << ((datetimes[i + 1].strftime('%Q').to_i -
                  datetimes[i].strftime('%Q').to_i).to_s[0...-2].to_f / 10).to_s
    end

    return_array.empty? ? '0' : return_array
  else
    '0'
  end
end
