require_relative '../vitaly_gavrilenya_hw_03_t_01'

RSpec.describe 'Task1' do
  describe '#sort_log' do
    subject { sort_log(logs) }

    context 'when no log present' do
      let(:logs) { '' }

      it 'returns empty string' do
        expect(subject).to eql('')
      end
    end

    context 'when no error present' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns empty string' do
        expect(subject).to eql('')
      end
    end

    context 'when one error present' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns string with error' do
        expect(subject).to eql('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>')
      end
    end

    context 'when several errors present' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          2018-04-23 20:30:40: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns first string with error' do
        expect(subject).to eql('2018-04-23 20:30:40: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System Error: Undefined Error: 0 - 0>')
      end
    end
  end
end
