# frozen_string_literal: true

def task2(logs)
  regexp = /^(\d{2}\.\d\.\d{3}\.\d{3}).*(\[.*\]) "POST (.*) HTTP/
  logs.split("\n").select { |line| line[regexp] }.map do |line|
    line[regexp]
    "#{Regexp.last_match(2)} FROM: #{Regexp.last_match(1)} TO: #{Regexp.last_match(3).upcase}"
  end
end
