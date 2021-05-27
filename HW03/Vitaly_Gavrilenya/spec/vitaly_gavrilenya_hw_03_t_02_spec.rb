require_relative '../vitaly_gavrilenya_hw_03_t_02'

RSpec.describe 'Task2' do
  describe '#sort_log' do
    subject { sort_log(log) }

    context 'when no log present' do
      let(:log) { '' }

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end

    context 'when no post requests present' do
      let(:log) do
        <<~LOGS
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>
        LOGS
      end

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end

    context 'when post requests present' do
      let(:log) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns array of stings' do
        expect(subject).to eql(
          [
            '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498',
            '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277',
            '10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
          ]
        )
      end
    end
  end

  describe '#parse_data' do
    subject { parse_data(sorted_log) }

    context 'when no log array present' do
      let(:sorted_log) { [] }

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end

    context 'when array with post requests present' do
      let(:sorted_log) do
        [
          '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498',
          '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277',
          '10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
        ]
      end

      it 'returns array of formatted strings' do
        expect(subject).to eql(
          [
            '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
            '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
            '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
          ]
        )
      end
    end
  end
end
