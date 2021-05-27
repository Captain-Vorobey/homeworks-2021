require './Nastja_Kireeva_hw_03_t_03'

RSpec.describe 'Task3' do
  describe '.task3' do
    let(:logs) do
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

    let(:empty_logs) { '' }

    context 'when there are no valid events' do
      it 'returns 0' do
        expect(task3(empty_logs)).to eq(0)
      end
    end

    context 'when there are more than one valid event' do
      it 'returns a duration between the events' do
        expect(task3(logs)).to eq('49.1')
      end
    end

    context 'when no logs are given' do
      it 'returns ArgumentError' do
        expect { task3 }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.calculate_diff' do
    let(:empty_events) { [] }

    context 'when events are valid' do
      let(:valid_events) do
        [
          '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action:
          event',
          '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action:
          messages'
        ]
      end
      it 'returns a duration between the events' do
        expect(calculate_diff(valid_events)).to eq('49.1')
      end
    end

    context 'when events of appropriate format are invalid' do
      let(:invalid_events) do
        [
          '2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101',
          '2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
        ]
      end
      it 'returns a duration between the events' do
        expect(calculate_diff(invalid_events)).to eq('21.0')
      end
    end

    context 'when there are no events' do
      it 'returns an empty string' do
        expect(calculate_diff(empty_events)).to eq('')
      end
    end
  end
end
