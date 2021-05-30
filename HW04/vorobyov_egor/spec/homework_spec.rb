require '../lib/homework'

RSpec.describe Homework do
  describe '#new' do
    context 'when all parameters were passed' do
      it 'returns an object of homework class' do
        allow(Homework).to receive(:new).with(title: 'title', description: 'desc',
                                              student: double('student')).and_call_original
      end
    end

    context 'when parameters were not passed' do
      it 'returns ArgumentError' do
        expect { Homework.new }.to raise_error(ArgumentError)
      end
    end
  end
end
