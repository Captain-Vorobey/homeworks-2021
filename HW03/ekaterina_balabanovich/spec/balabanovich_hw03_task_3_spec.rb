# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_3'

RSpec.describe 'Task3' do
  describe '#extract_core_log' do
    subject { extract_core_log(logs) }

    context 'when logs are not empty' do
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

      let(:expected_output) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        LOGS
      end

      it { is_expected.to eq(expected_output) }
    end

    context 'when logs are empty' do
      let(:logs) { '' }

      it { is_expected.to eq('') }
    end

    context 'when logs are not string' do
      subject { -> { extract_core_log(12) } }

      it { is_expected.to raise_error ArgumentError }
    end
  end

  describe '#duration_count' do
    subject { duration_count(extract_core_log(logs)) }

    context 'when logs contain one line' do
      let(:logs) { '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event' }

      it { is_expected.to eq(0) }
    end

    context 'when logs contain more than one lines' do
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

      it { is_expected.to eq([49.1]) }
    end

    context 'when logs are empty' do
      let(:logs) { '' }

      it { is_expected.to eq(0) }
    end
  end
end
