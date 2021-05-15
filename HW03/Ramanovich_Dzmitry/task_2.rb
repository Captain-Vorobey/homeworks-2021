# frozen_string_literal: true

DATA = /\[.*\]/.freeze
FROM = /\d+\.+\d+\.+\d+\.+\d*/.freeze
TO = /POST (.*) HTTP/.freeze

def task2(example)
  array = []
  lines = example.split("\n")
  lines.each do |str|
    data = str.scan(DATA).first
    next if data.nil?

    from = str.scan(FROM).first
    to = str.scan(TO).first

    array << "DATE: #{data} FROM: #{from} TO: #{to}"
  end
  array
end
