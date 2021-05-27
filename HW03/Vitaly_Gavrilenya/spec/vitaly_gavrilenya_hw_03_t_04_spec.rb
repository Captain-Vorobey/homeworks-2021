require_relative '../vitaly_gavrilenya_hw_03_t_04'

RSpec.describe 'Task4' do
  describe '#chars_counter' do
    subject { chars_counter(str) }

    context 'when no chars in the string present' do
      let(:str) { '' }

      it 'returns zeroes' do
        expect(subject).to eql({:letters=>0, :digits=>0})
      end
    end

    context 'when no digits and letters present in the string' do
      let(:str) { '$%#$' }

      it 'returns zeroes' do
        expect(subject).to eql({:letters=>0, :digits=>0})
      end
    end

    context 'when only letters present in the string' do
      let(:str) { 'wicked .. !' }

      it 'return the count of letters and zero digits' do
        expect(subject).to eql({:letters=>6, :digits=>0})
      end
    end

    context 'when only digits present in the string' do
      let(:str) { '12356' }

      it 'return the count of digits and zero letters' do
        expect(subject).to eql({:letters=>0, :digits=>5})
      end
    end

    context 'when both letters and digits present in the string' do
      let(:str) { 'hel2!lo' }

      it 'return the count of letters and digits' do
        expect(subject).to eql({:letters=>5, :digits=>1})
      end
    end
  end
end
