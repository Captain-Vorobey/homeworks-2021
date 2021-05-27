# frozen_string_literal: true

require_relative './Uladzislau_Kanapliou_hw_03_t_03'

describe '.task3' do
  it 'returns an array of strings' do
    logs = '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
			2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
			2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
			2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
			2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
			2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
			2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
			2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    expect(task3(logs).class).to eq(Array)
  end

  it 'returns "0" if there are no valid events at the entrance or it is the only one' do
    line = '2018-04-23 20:30:42'
    expect(task3(line)).to eq('0')
  end
end
