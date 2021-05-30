require '../lib/participant'

RSpec.describe Participant do
  describe '#new' do
    context 'when all parameters were passed' do
      it 'returns an object of partipant class' do
        allow(Participant).to receive(:new).with(name: 'Egot', surname: 'Vorobyov', age: 20).and_call_original
      end
    end

    context 'when parameters were not passed' do
      it 'raises ArgumentError' do
        expect { Participant.new }.to raise_error(ArgumentError)
      end
    end

    context 'when parameters were passed more then 3' do
      it 'raises ArgumentError' do
        expect { Participant.new('name', 'surname', 43, 54) }.to raise_error(ArgumentError)
      end
    end
  end
end
