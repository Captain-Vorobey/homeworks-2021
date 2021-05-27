# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_2'

RSpec.describe 'Task2' do
  describe '#log_format' do
    subject { log_format(logs) }

    context 'when logs contain correct log messages' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] 'POST /test/2/run HTTP/1.1' 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0290
        LOGS
      end

      let(:expected_output) do
        ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
         '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
         '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']
      end

      it { is_expected.to eq(expected_output) }
    end

    context 'when logs contain only error messages' do
      let(:logs) do
        <<~LOGS
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        LOGS
      end

      it { is_expected.to eq([]) }
    end

    context 'when logs include POST messages in a different order' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
          POST /test/2/messages HTTP/1.1' 10.6.246.101 - - [23/Apr/2018:20:31:39 +0300]  200 48 0.0290
        LOGS
      end

      let(:expected_output) do
        ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
         '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES']
      end

      it { is_expected.to eq(expected_output) }
    end

    context 'when logs contain repeated messages' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 'POST /test/2/messages HTTP/1.1' 200 48 0.0498
        LOGS
      end

      let(:expected_output) do
        ['23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES']
      end

      it { is_expected.to eq(expected_output) }
    end

    context 'when logs are empty' do
      let(:logs) { '' }

      it { is_expected.to eq([]) }
    end

    context 'when logs are not string' do
      subject { -> { log_format(12) } }

      it { is_expected.to raise_error ArgumentError }
    end
  end
end
