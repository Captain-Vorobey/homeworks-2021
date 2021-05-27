# frozen_string_literal: true

require_relative './Uladzislau_Kanapliou_hw_03_t_02'

describe '.task2' do
  it 'it return an array of formatted strings containing information about post requests' do
    logs = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    result = [
      '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES ',
      '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN ',
      '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES '
    ]
    expect(task2(logs)).to eq(result)
  end

  it 'it return an empty array if logs does not contain post requests' do
    line = '2018-04-23 20:30:42'
    expect(task2(line)).to eq([])
  end
end
