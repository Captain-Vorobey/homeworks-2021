require_relative '../my_methods'

using NewArrayMethods

RSpec.describe NewArrayMethods do
  let(:my_array) { [1, 2, 3, 4] }

  describe '#my_map' do
    context 'when block is given' do
      it 'returns new array' do
        expect(my_array.my_map { |el| el + 1 }).to eql([2, 3, 4, 5])
      end

      it 'makes no change in initial array' do
        my_array.my_map { |el| el + 1 }
        expect(my_array).to eql([1, 2, 3, 4])
      end
    end

    context 'when no block is given' do
      it 'returns "nil"' do
        expect(my_array.my_map).to be(nil)
      end
    end
  end

  describe '#my_select' do
    context 'when block is given' do
      it 'returns a new array containing those elements of initial array for which the block returns a truthy value' do
        expect(my_array.my_select { |el| el > 2 }).to eql([3, 4])
      end

      it 'returns empty array if no condition met' do
        expect(my_array.my_select { |el| el > 4 }).to eql([])
      end

      it 'makes no change in initial array' do
        my_array.my_select { |el| el > 2 }
        expect(my_array).to eql([1, 2, 3, 4])
      end
    end

    context 'when no block is given' do
      it 'returns "nil"' do
        expect(my_array.my_select).to be(nil)
      end
    end
  end

  describe '#my_each' do
    context 'when block is given' do
      it 'returns initial array' do
        expect(my_array.my_each { |el| p el }).to eql([1, 2, 3, 4])
      end

      it 'iterates over array' do
        expect { my_array.my_each { |el| p el } }.to output("1\n2\n3\n4\n").to_stdout
      end
    end

    context 'when no block is given' do
      it 'returns "nil"' do
        expect(my_array.my_each).to be(nil)
      end
    end
  end
end
