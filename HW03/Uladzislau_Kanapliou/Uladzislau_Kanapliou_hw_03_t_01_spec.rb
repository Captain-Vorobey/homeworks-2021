# frozen_string_literal: true

require_relative './Uladzislau_Kanapliou_hw_03_t_01'

describe '.task1' do
  it 'it returns line with an error' do
    line = '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    expect(task1(line)).to eq(line)
  end

  it 'it return an empty string if line does not contain error' do
    line = '2018-04-23 20:30:42'
    expect(task1(line)).to eq('')
  end
end
