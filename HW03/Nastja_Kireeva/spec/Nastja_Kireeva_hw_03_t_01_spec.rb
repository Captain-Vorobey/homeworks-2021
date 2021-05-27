require './Nastja_Kireeva_hw_03_t_01'

RSpec.describe 'Task1' do
  describe '.task1' do
    context 'when there is one error in logs' do
      let(:single_error_logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
        LOGS
      end

      let(:error_line) do
        '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
      end

      it 'returns line with an error' do
        expect(task1(single_error_logs)).to eq error_line
      end
    end

    context 'when there are multiple errors in logs' do
      let(:multiple_errors_logs) do
        <<~LOGS
          2018-05-26 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
        LOGS
      end

      let(:first_error_line) do
        '2018-05-26 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
      end

      it 'returns first of the error lines' do
        expect(task1(multiple_errors_logs)).to eq first_error_line
      end
    end

    context 'when there is no errors in logs' do
      let(:no_errors_logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
        LOGS
      end

      it 'returns an empty line' do
        expect(task1(no_errors_logs)).to eq('')
      end
    end

    context 'when no logs are given' do
      it 'returns ArgumentError' do
        expect { task1 }.to raise_error(ArgumentError)
      end
    end
  end
end
