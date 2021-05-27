require_relative '../vitaly_gavrilenya_hw_03_t_03'
require 'time'

RSpec.describe 'Task3' do
  describe '#sort_log' do
    subject { sort_log(log) }

    context 'when no log present' do
      let(:log) { '' }

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end

    context 'when no calling event present' do
      let(:log) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end

    context 'when calling events present' do
      let(:log) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns array of stings' do
        expect(subject).to eql(
          [
            '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
            '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
          ]
        )
      end
    end
  end

  describe '#parse_time' do
    subject { parse_time(sorted_log) }

    context 'when log array is empty' do
      let(:sorted_log) { [] }

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end

    context 'when array of calling events present' do
      let(:sorted_log) do
        [
          '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event',
          '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
        ]
      end

      it 'returns array of corresponding time values' do
        expect(subject.map(&:to_i)).to eql(
          [
            Time.parse('2018-04-23 17:17:49.7 +0300'),
            Time.parse('2018-04-23 17:18:38.8 +0300')
          ].map(&:to_i)
        )
      end
    end
  end

  describe '#operation_duration' do
    subject { operation_duration(parsed_time) }

    context 'when log array is empty' do
      let(:parsed_time) { [] }

      it 'returns "0"' do
        expect(subject).to eql('0')
      end
    end

    context 'when log array has less than 2 elements' do
      let(:parsed_time) { [Time.parse('2018-04-23 17:17:49.7 +0300')] }

      it 'returns "0"' do
        expect(subject).to eql('0')
      end
    end

    context 'when log array has 2 elements' do
      let(:parsed_time) { [Time.parse('2018-04-23 17:17:49.7 +0300'), Time.parse('2018-04-23 17:18:38.8 +0300')] }

      it 'returns a string containing the duration of the action in seconds between events' do
        expect(subject).to eql('49.1')
      end
    end

    context 'when log array has more than 2 elements' do
      let(:parsed_time) do
        [
          Time.parse('2018-04-23 17:17:49.7 +0300'),
          Time.parse('2018-04-23 17:18:38.8 +0300'),
          Time.parse('2018-04-23 17:19:43.5 +0300'),
          Time.parse('2018-04-23 17:20:32.4 +0300')
        ]
      end

      it 'returns an array of durations between 2 consecutive events' do
        expect(subject).to eql(['49.1', '64.7', '48.9'])
      end
    end
  end
end
