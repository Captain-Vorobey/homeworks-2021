# frozen_string_literal: true

require_relative './hw_03_t_02'

describe 'task_2' do
  let(:logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290
    LOGS
  end

  let(:strings_without_errors) do
    <<~LOGS
      ["23/Apr/2018:20:30:39 +0300"] FROM: ["10.6.246.103"] TO: ["/TEST/2/MESSAGES"]
      ["23/Apr/2018:20:30:42 +0300"] FROM: ["10.6.246.101"] TO: ["/TEST/2/RUN"]
      ["23/Apr/2018:20:31:39 +0300"] FROM: ["10.6.246.101"] TO: ["/TEST/2/MESSAGES"]
    LOGS
  end

  let(:logs_without_suitable_strings) do
    <<~LOGS
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    LOGS
  end

  let(:logs_with_wrong_format) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] 200 48 0.0498
      [23/Apr/2018:20:30:42 +0300] 0.2277 - -  10.6.246.101
    LOGS
  end

  context 'without errors' do
    it 'returns formatted strings without error' do
      expect(task_2(logs)).to eq strings_without_errors.split("\n")
    end
  end

  context 'without suitable strings' do
    it 'returns blank array' do
      expect(task_2(logs_without_suitable_strings)).to eq []
    end
  end

  context 'with wrong format' do
    it 'returns empty array' do
      expect(task_2(logs_with_wrong_format)).to eq []
    end
  end
end
