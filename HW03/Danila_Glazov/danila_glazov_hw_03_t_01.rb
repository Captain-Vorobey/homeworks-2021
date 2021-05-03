# frozen_string_literal: false

def find_error(logs)
  puts logs.split("\n").find { |log| log.downcase.include?('error') }.to_s
end
