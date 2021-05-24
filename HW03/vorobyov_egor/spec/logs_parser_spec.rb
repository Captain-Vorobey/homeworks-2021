# frozen_string_literal: true

require '../lib/logs_parser'

RSpec.describe LogsParser do
  let(:logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
    LOGS
  end

  let(:error) do
    '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
  end

  let(:formatted) do
    ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
     '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
     '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']
  end

  let(:time_arr) do
    ['2018-04-23 17:17:49.7',
     '2018-04-23 17:18:38.8',
     '2018-04-23 17:18:39.8']
  end

  let(:time_interval) { [49.1, 1.0] }

  let(:first_word) { 'hello1234' }
  let(:second_word) { 'hello' }
  let(:third_word) { '231!' }

  let(:first_hash) { { letters: 5, digits: 4 } }
  let(:second_hash) { { letters: 5, digits: 0 } }
  let(:third_hash) { { letters: 0, digits: 3 } }

  describe '.task_1' do
    context 'when arr of logs was passed' do
      it 'returns the first string with error' do
        expect(LogsParser.task_1(logs).chomp).to eq error
      end
    end

    context 'when arr wasn\'n passed' do
      it 'returns ArgumentError' do
        expect { LogsParser.task_1 }.to raise_error(ArgumentError)
      end
    end

    context 'when arr wasn\'n passed' do
      it 'returns NoMethodError' do
        expect { LogsParser.task_1([1, true, 'str', 4, 5]) }.to raise_error(NoMethodError)
      end
    end
  end

  describe '.task_2' do
    context 'when logs were passed' do
      it 'returns an array of formatted strings containing information about post requests' do
        expect(LogsParser.task_2(logs)).to eq formatted
      end
    end

    context 'when arr wasn\'t passed' do
      it 'returns ArgumentError' do
        expect { LogsParser.task_2 }.to raise_error(ArgumentError)
      end
    end

    context 'when arr wasn\'t passed' do
      it 'returns NoMethodError' do
        expect { LogsParser.task_2([8, false, 'str', :symbol, 5]) }.to raise_error(NoMethodError)
      end
    end
  end

  describe '.task_3' do
    context 'when arr was passed' do
      it 'returns an array of duration betwenn 1st and 2nd, 2nd and 3rd and etc' do
        expect(LogsParser.task_3(time_arr)).to eq time_interval
      end
    end

    context 'when arr wasn\'n passed' do
      it 'returns ArgumentError' do
        expect { LogsParser.task_3 }.to raise_error(ArgumentError)
      end
    end

    context 'when arr wasn\'n passed' do
      it 'returns TypeError' do
        expect do
          LogsParser.task_3([81, true, 'str111', :symbol, 32, { name: 'Egor', age: 20 }])
        end.to raise_error(TypeError)
      end
    end
  end

  describe '.task_4' do
    context 'when string was passed' do
      it 'returns count of letters and digits of input word' do
        expect(LogsParser.task_4(first_word)).to eq first_hash
        expect(LogsParser.task_4(second_word)).to eq second_hash
        expect(LogsParser.task_4(third_word)).to eq third_hash
      end
    end

    context 'when value wasn\'n passed' do
      it 'returns ArgumentError' do
        expect { LogsParser.task_4 }.to raise_error(ArgumentError)
      end
    end

    context 'when value wasn\'n passed' do
      it 'returns NoMethodError' do
        expect { LogsParser.task_4(3) }.to raise_error(NoMethodError)
      end
    end
  end
end
