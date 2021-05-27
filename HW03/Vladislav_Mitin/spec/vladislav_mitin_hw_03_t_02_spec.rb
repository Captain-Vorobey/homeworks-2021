require_relative '../vladislav_mitin_hw_03_t_02'

RSpec.describe 'task2' do
  subject { task2(logs) }

  let(:expected_logs) do
    [
      '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
      '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN'
    ]
  end

  context 'when logs are not string' do
    let(:logs) { 2 }
    it { within_block_is_expected.to raise_error NoMethodError }
  end

  context 'when logs has lines with error' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      LOGS
    end

    it { is_expected.to eq(expected_logs) }
  end

  context 'when logs have no lines with error' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      LOGS
    end

    it { is_expected.to eq(expected_logs) }
  end

  context 'when logs lines have invalid format' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/202/messages HTTP/1.1" 200 48 0.0498
        10.6.223/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      LOGS
    end

    it { is_expected.to be_empty }
  end
end
