# frozen_string_literal: true

require_relative './hw_03_t_04'

describe 'task_4' do
  let(:logs) do
    <<~LOGS
      hel2!lo
    LOGS
  end

  let(:logs_with_empty_string) do
    <<~LOGS
    LOGS
  end

  context 'when not empty string' do
    it 'returns a number of letters and digits in a string' do
      expect(task_4(logs)).to eq 'letters: 5, digits: 1'
    end
  end

  context 'when empty string' do
    it 'returns "letters: 0, digits: 0"' do
      expect(task_4(logs_with_empty_string)).to eq 'letters: 0, digits: 0'
    end
  end
end
