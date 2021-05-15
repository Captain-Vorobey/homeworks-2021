# frozen_string_literal: true

require_relative 'task_1'
require_relative 'task_2'
require_relative 'task_3'
require_relative 'task_4'

puts 'Test task_1'

logs = <<~LOG
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
LOG

puts task_1(logs)

puts '=========================='

puts 'Test task_2'

logs = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
LOGS

puts task2(logs)

puts '=========================='

puts 'Test task_3'

logs = <<~LOGS
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  2018-04-23 17:19:22.4 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:19:25.9 ubuntu-xenial[14319] Debug - inside docker_handle_event
  2018-04-23 17:19:48.6 ubuntu-xenial[14319] Debug - Calling core with action: event
LOGS

puts task_3(logs)

puts '=========================='

puts 'Test task_4'

p quantity('1234qweq!')
