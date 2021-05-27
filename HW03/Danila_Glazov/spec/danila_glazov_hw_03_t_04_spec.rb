# frozen_string_literal: false

require './danila_glazov_hw_03_t_04'

describe 'string_info' do
  let(:valid_arguments) { ['test_string', 'val1d', '123val1d#-!'] }
  let(:invalid_arguments) { [1, 1.0, true, false, nil, [], {}] }

  context 'when passed valid arguments' do
    it 'returns a hash with count of letters and digits' do
      expect(string_info(valid_arguments[0])).to eq({ letters: 10, digits: 0 })
      expect(string_info(valid_arguments[1])).to eq({ letters: 4, digits: 1 })
      expect(string_info(valid_arguments[2])).to eq({ letters: 4, digits: 4 })
    end
  end

  context 'when passed an empty string' do
    it 'returns a hash of letters and digits keys with 0 values' do
      expect(string_info('')).to eq({ letters: 0, digits: 0 })
    end
  end

  context 'when passed invalid argument' do
    it 'raises an exception' do
      invalid_arguments.each do |arg|
        expect { string_info(arg) }.to raise_error(TypeError)
      end
    end
  end

  context 'when passed no arguments' do
    it 'raises an exception' do
      expect { string_info }.to raise_error(ArgumentError)
    end
  end
end

describe 'letter_counter' do
  let(:valid_arguments) { ['test_string', 'val1d', '123val1d#-!'] }
  let(:invalid_arguments) { [1, 1.0, true, false, nil, [], {}] }

  context 'when passed valid argument' do
    it 'returns hash of letters with counts' do
      expect(letter_counter(valid_arguments[0])).to eq({ 't' => 3, 'e' => 1, 's' => 2, '_' => 1, 'r' => 1, 'i' => 1,
                                                         'n' => 1, 'g' => 1 })
      expect(letter_counter(valid_arguments[1])).to eq({ 'v' => 1, 'a' => 1, 'l' => 1, '1' => 1, 'd' => 1 })
      expect(letter_counter(valid_arguments[2])).to eq({ 'v' => 1, 'a' => 1, 'l' => 1, '1' => 2, 'd' => 1, '2' => 1,
                                                         '3' => 1, '#' => 1, '-' => 1, '!' => 1 })
    end
  end

  context 'when passed an empty string' do
    subject { letter_counter('') }
    it { is_expected.to be_empty }
  end

  context 'when passed invalid argument' do
    it 'raises an exception' do
      invalid_arguments.each do |arg|
        expect { letter_counter(arg) }.to raise_error(TypeError)
      end
    end
  end

  context 'when passed no arguments' do
    it 'raises an exception' do
      expect { letter_counter }.to raise_error(ArgumentError)
    end
  end
end
