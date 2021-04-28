require_relative './lib/logs_parser'

p '-------------------------------------------------------------------------------------------------------------------------------------------'

puts LogsParser.task_1('10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498',
                       '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277',
                       '2019-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>',
                       '10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290')

p '-------------------------------------------------------------------------------------------------------------------------------------------'

puts LogsParser.task_2('10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498',
                       '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277',
                       '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>',
                       '10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290')

p '-------------------------------------------------------------------------------------------------------------------------------------------'

# This action for taking logs which calling core
core_logs = ParsingFunctions.calling_core_logs(['2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
                                                '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
                                                '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed',
                                                '2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health',
                                                '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages',
                                                '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
                                                '2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'])

puts LogsParser.task_3(core_logs)

p '-------------------------------------------------------------------------------------------------------------------------------------------'

p LogsParser.task_4('hello!! 1212')
