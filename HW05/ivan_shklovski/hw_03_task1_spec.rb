# frozen_string_literal: true

require_relative './hw_03_t_01'

describe 'task_1' do
  let(:logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290
    LOGS
  end

  let(:string_with_error) do
    <<~LOGS
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    LOGS
  end

  let(:logs_without_errors) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290
    LOGS
  end

  context 'with error' do
    it 'returns string with error' do
      expect(task_1(logs)).to eq string_with_error.chomp
    end
  end

  context 'without error' do
    it 'returns empty string' do
      expect(task_1(logs_without_errors)).to eq nil
    end
  end
end
