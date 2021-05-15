# frozen_string_literal: true

logs = <<~LGSINPUT
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
LGSINPUT

REGEXP = %r{
(?<ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*\[                 # group ip - from
(?<data>\d{2}/.{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d+)\]\s"POST\s # group data
(?<to>/.*?)\sHTTP                                             # grope to
}x.freeze

def task_2(logs)
  array_log = []
  logs.each_line do |line|
    if (m_data = REGEXP.match(line))
      array_log << "DATA #{m_data['data']} FROM: #{m_data['ip']} TO: #{m_data['to'].upcase}"
    end
  end
  puts array_log.inspect
end

task_2(logs)
