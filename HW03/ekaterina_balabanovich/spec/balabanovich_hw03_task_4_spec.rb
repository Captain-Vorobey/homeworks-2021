# frozen_string_literal: true

require_relative '../balabanovich_hw03_task_4'

RSpec.describe 'Task4' do
  describe '#letter_digit_count' do
    subject { letter_digit_count(string) }

    context 'when string is empty' do
      let(:string) { '' }

      it { is_expected.to eq('letters: 0, digits: 0') }
    end

    context 'when string is "hel!0"' do
      let(:string) { 'hel!0' }

      it { is_expected.to eq('letters: 3, digits: 1') }
    end

    context 'when argument is not string' do
      subject { -> { letter_digit_count(12) } }

      it { is_expected.to raise_error ArgumentError }
    end
  end
end
