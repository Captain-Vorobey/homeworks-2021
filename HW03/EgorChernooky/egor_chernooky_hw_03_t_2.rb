# frozen_string_literal: true

DATE = /\[(.*?)\]/.freeze
FROM = /^\d{2}\.\d{1}\.\d{3}\.\d{3}/.freeze
TO = %r{/\w*/\d{1}/\w*\b}.freeze

logs =
  '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290'

def task2(text)
  text.split("\n").select { |line| line.downcase.include?('post') }.map do |line|
    date = line.scan(DATE).join
    from = line.scan(FROM).join
    to = line.scan(TO).join.upcase
    "#{date} FROM: #{from} TO: #{to}"
  end
end

p task2(logs)
