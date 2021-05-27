# frozen_string_literal: false

require './danila_glazov_hw_03_t_01'

describe 'find_error' do
  let(:logs_with_error) do
    [
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498',
      '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277',
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>',
      '10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
    ].join("\n")
  end

  let(:logs_without_error) do
    [
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498',
      '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277',
      '10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
    ].join("\n")
  end

  let(:non_string_objects) { [1, 1.0, [1], true, false, nil, {}, :sym] }

  context 'when passed logs with error' do
    it 'returns log with error' do
      expect { find_error(logs_with_error) }.to output(/.*error.*/).to_stdout
    end
  end

  context 'when passed logs without error' do
    it 'returns an empty string' do
      expect { find_error(logs_without_error) }.to output("\n").to_stdout
    end
  end

  context 'when passed no arguments' do
    it 'raises an exeption' do
      expect { find_error }.to raise_error(ArgumentError)
    end
  end

  context 'when argument in not a string' do
    it 'rises an exeption' do
      non_string_objects.each do |obj|
        expect { find_error(obj) }.to raise_error(NoMethodError)
      end
    end
  end
end
