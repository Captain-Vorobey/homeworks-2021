# frozen_string_literal: false

require './danila_glazov_hw_03_t_02'

describe 'format_logs' do
  let(:test_logs) do
    [
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498',
      '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277',
      '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>',
      '10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    ].join("\n")
  end
  let(:formated_logs) do
    [
      '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
      '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
      '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
    ]
  end
  let(:invalid_logs) do
    [
      '2016-02-13 10:37:13: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>',
      '2017-05-23 17:28:34: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>',
      '2018-05-19 22:20:12: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>',
      '2019-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
    ].join("\n")
  end
  let(:non_string_objects) { [1, 1.0, [1], true, false, nil, {}, :sym] }

  context 'when passed logs' do
    it 'select logs with valid format' do
      expect(test_logs.split("\n").count).to eq(4)
      expect(format_logs(test_logs).count).to eq(3)
    end

    it 'returns an array of formated logs' do
      expect(format_logs(test_logs)).to eq(formated_logs)
    end
  end

  context 'when passed logs with invalid format' do
    subject { format_logs(invalid_logs) }
    it { is_expected.to be_empty }
  end

  context 'when passed no arguments' do
    it 'raises an exeption' do
      expect { format_logs }.to raise_error(ArgumentError)
    end
  end

  context 'when argument in not a string' do
    it 'rises an exeption' do
      non_string_objects.each do |obj|
        expect { format_logs(obj) }.to raise_error(NoMethodError)
      end
    end
  end
end
