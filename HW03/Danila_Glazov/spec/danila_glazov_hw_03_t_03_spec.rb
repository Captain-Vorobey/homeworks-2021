# frozen_string_literal: false

require './danila_glazov_hw_03_t_03'

describe 'durations' do
  let(:actions) do
    [
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
      '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed',
      '2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health',
      '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages',
      '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
      '2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
    ].join("\n")
  end

  let(:valid_actions) do
    [
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
      '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    ].join("\n")
  end

  let(:invalid_actions) do
    [
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
      '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed',
      'invalid action'
    ].join("\n")
  end

  let(:actions_with_one_valid) do
    [
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
      '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed'
    ].join("\n")
  end
  let(:non_string_objects) { [1, 1.0, [1], true, false, nil, {}, :sym] }

  context 'when actions passed' do
    it 'returns a durations between valid actions' do
      expect(durations(actions)).to eq('49.1')
      expect(durations(valid_actions)).to eq('49.1')
    end
  end

  context 'when actions include 0 or 1 valid adctions' do
    it "returns '0' string" do
      expect(durations(invalid_actions)).to eq('0')
      expect(durations(actions_with_one_valid)).to eq('0')
    end
  end

  context 'when passed no arguments' do
    it 'raises an exeption' do
      expect { durations }.to raise_error(ArgumentError)
    end
  end

  context 'when passed invalid arguments' do
    it 'raises an exeption' do
      non_string_objects.each do |obj|
        expect { durations(obj) }.to raise_error(NoMethodError)
      end
    end
  end
end

describe 'calc_durations' do
  let(:valid_actions) do
    [
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
      '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    ]
  end

  let(:invalid_actions) do
    [
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
      '2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed'
    ]
  end

  let(:incorrect_format_actions) do
    [
      'incorrect action 1',
      'incorrect action 2'
    ]
  end

  let(:non_array_objects) { [1, 1.0, '', true, false, nil, {}, :sym] }

  context 'when passed valid actions' do
    it 'returns an array with calculated durations' do
      expect(calc_durations(valid_actions)).to eq(['49.1'])
    end
  end

  context 'when passed invalid actions with correct format' do
    it 'returns an array with calculated durations' do
      expect(calc_durations(invalid_actions)).to eq(['0.1'])
    end
  end

  context 'when passed invalid actions with incorrect format' do
    it 'raises an exeption' do
      expect { calc_durations(incorrect_format_actions) }.to raise_error(NoMethodError)
    end
  end

  context 'when passed no arguments' do
    it 'raises an exeption' do
      expect { calc_durations }.to raise_error(ArgumentError)
    end
  end

  context 'when passed invalid arguments' do
    it 'raises an exeption' do
      non_array_objects.each do |obj|
        expect { calc_durations(obj) }.to raise_error(TypeError)
      end
    end
  end
end
