require '../lib/logs_parser'

RSpec.describe LogsParser do
  # Input data of task_1 and task_2 tests
  logs = <<~LOGS
    10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
    10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
    2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
  LOGS

  # Output of task_1
  error = '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'

  # Output of task_2
  res = ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
         '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
         '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']

  # Input data of task_3 test
  time_arr = ['2018-04-23 17:17:49.7',
              '2018-04-23 17:18:38.8',
              '2018-04-23 17:18:39.8']

  # Output data of task_3 test
  time_interval = [49.1, 1.0]

  # Input of task_4 task tests
  first_word = 'hello1234'
  second_word = 'hello'
  third_word = '231!'

  # Output of task_4 tests
  let(:first_hash) { { letters: 5, digits: 4 } }
  let(:second_hash) { { letters: 5, digits: 0 } }
  let(:third_hash) { { letters: 0, digits: 3 } }

  describe '.task_1' do
    it 'should return the first string with error' do
      expect(LogsParser.task_1(logs).chomp).to eq error
    end
  end

  describe '.task_2' do
    it 'should return an array of formatted strings containing information about post requests' do
      expect(LogsParser.task_2(logs)).to eq res
    end
  end

  describe '.task_3' do
    it 'should return an array of duration betwenn 1st and 2nd, 2nd and 3rd and etc' do
      expect(LogsParser.task_3(time_arr)).to eq time_interval
    end
  end

  describe '.task_4' do
    it 'should return count of letters and digits of input word' do
      expect(LogsParser.task_4(first_word)).to eq first_hash
      expect(LogsParser.task_4(second_word)).to eq second_hash
      expect(LogsParser.task_4(third_word)).to eq third_hash
    end
  end
end
