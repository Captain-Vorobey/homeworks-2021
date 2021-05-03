# frozen_string_literal: true

log = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'

DATE_REGEXP = /\[(.*?)\]/.freeze
FROM_REGEXP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
TO_REGEXP = /POST (.*) HTTP/.freeze

def sort_log(log)
  log.split("\n").select { |line| line.downcase.include?('post') }
end

def parse_data(log)
  log.map do |line|
    date = line.scan(DATE_REGEXP).join
    from = line.scan(FROM_REGEXP).join
    to = line.scan(TO_REGEXP).join.upcase
    "#{date} FROM: #{from} TO: #{to}"
  end
end

sorted_log = sort_log(log)
parse_data(sorted_log)
