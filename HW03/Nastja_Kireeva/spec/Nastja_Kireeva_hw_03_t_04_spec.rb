require './Nastja_Kireeva_hw_03_t_04'

RSpec.describe 'Task4' do
  describe '.task4' do
    context 'when string is given' do
      it 'returns the count of letters and digits in the string', :aggregate_failures do
        expect(task4('wicked .. !')).to eq({ digits: 0, letters: 6 })
        expect(task4('hel2!lo')).to eq({ digits: 1, letters: 5 })
      end
    end

    context 'when string is empty' do
      it 'returns zero results' do
        expect(task4('')).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when a string is not given' do
      it 'returns ArgumentError' do
        expect { task4 }.to raise_error(ArgumentError)
      end
    end
  end
end
