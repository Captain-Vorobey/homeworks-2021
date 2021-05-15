# frozen_string_literal: true

DATE = %r{\d+/[A-z]+/\d+:+\d+:+\d+:+\d+\s+\+\d+}.freeze
FROM = /^\d+\.\d+\.\d+\.\d+/.freeze
TO = %r{/\w+/\w+/\w+}.freeze
FORMAT = %r{^\d+\.\d+\.\d+\.\d+ - - \[\d+/[A-z]+/\d+:+\d+:+\d+:+\d+\s+\+\d+\] "POST /\w+/\w+/\w+ HTTP/1\.1"}.freeze

def task2(input_string)
  lines_array = input_string.split("\n")
  lines_array.select { |line| line.scan(FORMAT)[0] }.map do |line|
    from = line.scan(FROM)[0]
    date = line.scan(DATE)[0]
    to = line.scan(TO)[0]
    "#{date} FROM: #{from} TO: #{to.upcase}"
  end
end

log = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'

puts log
puts
puts task2(log)
