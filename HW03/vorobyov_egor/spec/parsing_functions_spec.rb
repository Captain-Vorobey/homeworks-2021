require '../lib/parsing_functions'

RSpec.describe ParsingFunctions do
  string = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] \'POST /test/2/messages HTTP/1.1\' 200 48 0.0498'
  output_string = '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES'

  let(:logs) do
    ['2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
     '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
     '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed',
     '2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health',
     '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages',
     '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
     '2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event']
  end
  let(:error_string) do
    '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
  end
  let(:no_error_string) { '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] \'POST /test/2/run HTTP/1.1\' 200 - 0.2277' }
  let(:output_difference) { 49.1 }
  let(:core_logs) do
    ['2018-04-23 17:17:49.7',
     '2018-04-23 17:18:38.8']
  end

  let(:first_date) { '2018-04-23 17:17:49.7' }
  let(:second_date) { '2018-04-23 17:18:38.8' }

  describe '.formatted' do
    context 'when string passed'
    it 'returns a formatted string' do
      expect(ParsingFunctions.formatted(string)).to eq output_string
    end
  end

  describe '.calling_core_logs' do
    context 'when logs passed' do
      it 'returns logs which calling core with action' do
        expect(ParsingFunctions.calling_core_logs(logs)).to eq core_logs
      end
    end
  end

  describe '.dates_difference' do
    context 'when two dates passed' do
      it 'returns a difference between two dates of input' do
        expect(ParsingFunctions.dates_difference(first_date, second_date)).to eq output_difference
      end
    end
  end

  describe '.with_error?' do
    context 'when string has an error' do
      it 'returns true' do
        expect(ParsingFunctions.with_error?(error_string)).to eq true
        expect(ParsingFunctions.with_error?(no_error_string)).to eq false
      end
    end
  end
end
