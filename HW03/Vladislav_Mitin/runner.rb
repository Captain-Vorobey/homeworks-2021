# frozen_string_literal: true

require_relative 'vladislav_mitin_hw_03_t_01'
require_relative 'vladislav_mitin_hw_03_t_02'
require_relative 'vladislav_mitin_hw_03_t_03'
require_relative 'vladislav_mitin_hw_03_t_04'

logs = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 1>
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ErRor, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
LOGS

puts 'Task 1:'
puts "\nData: \n#{logs}\n"
puts "Output: #{task1(logs)}\n"

puts '--------------------------------'

logs = <<~LOGS
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
LOGS

puts 'Task 2: '
puts "\nData: \n#{logs}\n"
puts "Output: #{task2(logs)}\n"

puts '--------------------------------'

logs = <<~LOGS
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:19:39.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
LOGS

puts 'Task 3: '
puts "\nData: \n#{logs}\n"
puts "Output: #{task3(logs)}\n"

puts '--------------------------------'

data = 'wicked 2.. ! 3 w'

puts 'Task 4: '
puts "\nData: \n#{data}\n"
puts "Output: #{task4(data)}\n"
