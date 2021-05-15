# frozen_string_literal: true

DATE_REG = %r{[0-3]\d/[A-za-z]{3}/[1-2]\d{3}:[0-2][0-4]:[0-5]\d:[0-5]\d\s\+[0-9]{4}}.freeze
BODY_REG = %r{/[a-z]+/\d/[a-z]+}.freeze
IP_REG = /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/.freeze

def task2(logs)
  array = logs.split("\n")

  ret_array = []
  array.each do |line|
    date = line.slice(DATE_REG)
    ip = line.slice(IP_REG)
    body = line.slice(BODY_REG)

    if (date && ip && body).instance_of?(String)
      ret_line = "#{date} FROM: #{ip} TO: #{body.upcase}"
      ret_array << ret_line
    end
  end

  ret_array
end
