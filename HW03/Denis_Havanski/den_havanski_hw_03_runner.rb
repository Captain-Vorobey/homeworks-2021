# frozen_string_literal: true

require_relative 'den_havanski_hw_03_t_01'
require_relative 'den_havanski_hw_03_t_02'
require_relative 'den_havanski_hw_03_t_03'
require_relative 'den_havanski_hw_03_t_04'

logs = <<~INPUT
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
INPUT

puts '----- Task_1 -----'
puts task1(logs)

#######################

logs = <<~INPUT
  10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
  10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
  2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
  10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
INPUT

puts "\n----- Task_2 -----"
puts task2(logs)

#######################

logs = <<~INPUT
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
INPUT

logs1 = <<~INPUT # Only one valid event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - Calling core docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core inside docker_handle_event
INPUT

logs2 = <<~INPUT # Many valid events
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug -  with action: messages
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
INPUT

puts "\n----- Task_3 -----"
puts "#{task3(logs)} \n"
puts "Only one valid event: #{task3(logs1)} \n"
puts "Many valid events: #{task3(logs2)} \n"

#######################

puts "\n----- Task_4 -----"
puts task4('hel2!lo')
puts task4('wicked .. !')
puts task4('LJjom&*&odfщоыо/?<вадоыва938984:*(Щьдьждб*&(*KJLMLM<:<')
