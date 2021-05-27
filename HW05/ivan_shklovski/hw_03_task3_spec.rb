# frozen_string_literal: true

require_relative './hw_03_t_03'

describe 'task_3' do
  let(:logs) do
    <<~LOGS
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:22.4 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:19:25.9 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:48.6 ubuntu-xenial[14319] Debug - Calling core with action: event
    LOGS
  end

  let(:logs_without_events) do
    <<~LOGS
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:25.9 ubuntu-xenial[14319] Debug - inside docker_handle_event
    LOGS
  end

  context 'with valid events' do
    it 'returns duration in seconds between events' do
      expect(task_3(logs)).to eq '49.1,21.0,22.6,26.2'
    end
  end

  context 'without valid events' do
    it 'returns "0"' do
      expect(task_3(logs_without_events)).to eq '0'
    end
  end
end
