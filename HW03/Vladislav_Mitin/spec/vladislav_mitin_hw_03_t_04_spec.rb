require_relative '../vladislav_mitin_hw_03_t_04'

RSpec.describe 'task4' do
  subject { task4(text) }

  context 'when the method argument is not string' do
    let(:text) { 2 }
    it { within_block_is_expected.to raise_error NoMethodError }
  end

  context 'when the method argument has digits and letters' do
    let(:text) { 'wicked 2.. ! 3 w' }

    it { is_expected.to eq({ digits: 2, letters: 7 }) }
  end

  context 'when the method argument is empty' do
    let(:text) { '' }

    it { is_expected.to eq({ digits: 0, letters: 0 }) }
  end
end
