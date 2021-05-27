require_relative '../vladislav_mitin_hw_03_t_03'

RSpec.describe 'task3' do
  subject { task3(logs) }

  context 'when logs are not string' do
    let(:logs) { 2 }
    it { within_block_is_expected.to raise_error NoMethodError }
  end

  context 'when logs have more than two core events' do
    let(:logs) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      LOGS
    end

    it { is_expected.to eq(['49.1', '60.0']) }
  end

  context 'when logs have two core events' do
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

    it { is_expected.to eq(['49.1']) }
  end

  context 'when logs have one core events' do
    let(:logs) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      LOGS
    end

    it { is_expected.to eq('0') }
  end

  context 'when logs have no core events' do
    let(:logs) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      LOGS
    end

    it { is_expected.to eq('0') }
  end
end
