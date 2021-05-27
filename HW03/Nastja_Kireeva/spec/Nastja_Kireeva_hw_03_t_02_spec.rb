require './Nastja_Kireeva_hw_03_t_02'

RSpec.describe 'Task2' do
  describe '.task2' do
    context 'when logs are present' do
      context 'when logs are valid' do
        let(:logs) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1'
            200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 
            200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , 
            #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 
            200 48 0.0290
          LOGS
        end

        let(:formatted_logs) do
          ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
           '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
           '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']
        end

        it 'returns an array with formatted logs' do
          expect(task2(logs)).to eq formatted_logs
        end
      end

      context 'when logs are not  valid' do
        let(:error_log) do
          '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , 
          #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
        end

        it 'ignores error lines' do
          expect(task2(error_log)).to eq([])
        end
      end
    end

    context 'when there are no suitable logs' do
      let(:logs) { 'logs' }

      it 'returns an empty array' do
        expect(task2(logs)).to eq([])
      end
    end

    context 'when logs are not present' do
      it 'returns ArgumentError' do
        expect { task2 }.to raise_error(ArgumentError)
      end
    end
  end
end
