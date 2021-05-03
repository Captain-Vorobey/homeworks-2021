# frozen_string_literal: true

logs = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
LOGS

TEXT_REGEX = %r{/\w+/\d/\w+}.freeze
IP_REGEX = %r{(\d{1,3}\.){3}\d{1,3}}.freeze
TIME_REGEX = %r{\d{1,2}/\w+/\d{4}(:\d{2}){3}[[:space:]]\+\d{4}}.freeze

def log_format(logs)
  logs.each_line do |line|
    text = TEXT_REGEX.match(line).to_s.upcase
    next if text.empty?

    ip = IP_REGEX.match(line).to_s
    time = TIME_REGEX.match(line).to_s
    "#{time} FROM: #{ip} TO: #{text}"
  end
end

log_format(logs)
