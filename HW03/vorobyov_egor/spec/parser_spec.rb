require 'rspec/autorun'
require_relative '../lib/logs_parser'
require_relative '../lib/parsing_functions'

res = ['2018-04-23 17:17:49.7',
       '2018-04-23 17:18:38.8',
       '2018-04-23 17:18:39.8']

describe ParsingFunctions do
  it 'shoud return arr of logs dates' do
    arr = ['2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
           '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
           '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed',
           '2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health',
           '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages',
           '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
           '2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event',
           '2018-04-23 17:18:39.8 ubuntu-xenial[14319] Debug - Calling core with action: messages']

    expect(ParsingFunctions.calling_core_logs(arr)).to eq res
  end
end

describe LogsParser do
  it 'shoud return log with an error' do
    first_error = '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    second_error = '2019-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    third_error = '2020-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'

    log_1 = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498'
    log_2 = '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277'
    log_3 = '10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'

    expect(LogsParser.task_1(log_1, first_error, log_2, log_3)).to eq first_error
    expect(LogsParser.task_1(second_error, log_2, log_3)).to eq second_error
    expect(LogsParser.task_1(log_1, log_2, third_error)).to eq third_error
  end

  it 'should return an array of duration betwenn 1st and 2nd, 2nd and 3rd and etc' do
    expect(LogsParser.task_3(res)).to eq [49.1, 1.0]
  end

  it 'should return count of letters and digits of input word' do
    first_hash = { letters: 5, digits: 4 }
    second_hash = { letters: 5, digits: 0 }
    third_hash = { letters: 0, digits: 3 }

    expect(LogsParser.task_4('hello1234')).to eq first_hash
    expect(LogsParser.task_4('hello')).to eq second_hash
    expect(LogsParser.task_4('231!')).to eq third_hash
  end
end
