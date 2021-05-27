# frozen_string_literal: true

require_relative '../array_methods'

using ArrayMethods

RSpec.describe ArrayMethods do
  let(:empty_array) { [] }
  let(:array) { [1, 2, 3] }

  describe '.my_map' do
    context 'when array is empty' do
      it 'is empty' do
        expect(empty_array.my_map(&:odd?)).to be_empty
      end
    end

    context 'when array is not empty' do
      it 'returns the same number of elements as the original array' do
        expect(array.my_map(&:odd?).count).to eq(array.count)
      end
    end

    context 'when block is not given' do
      it 'returns nil' do
        expect(array.my_map).to be nil
      end
    end

    context 'when block is given' do
      it 'returns array changed by block' do
        expect(array.my_map { |a| a + 1 }).to eq([2, 3, 4])
      end

      it 'does not change the original array' do
        array.my_map { |a| a + 1 }
        expect(array).to eq([1, 2, 3])
      end
    end
  end

  describe '.my_select' do
    context 'when array is empty' do
      it 'is empty' do
        expect(empty_array.my_select(&:odd?)).to be_empty
      end
    end

    context 'when block is not given' do
      it 'returns nil' do
        expect(array.my_select).to be nil
      end
    end

    context 'when block is given' do
      it 'returns only elements which satisfy the condition' do
        expect(array.my_select(&:odd?)).to eq([1, 3])
      end

      it 'does not change the original array' do
        array.my_select { |a| a + 1 }
        expect(array).to eq([1, 2, 3])
      end
    end
  end

  describe '.my_each' do
    context 'when array is empty' do
      it 'is empty' do
        expect(empty_array.my_each(&:odd?)).to be_empty
      end
    end

    context 'when array is not empty' do
      it 'returns the same number of elements as the original array' do
        expect(array.my_each(&:odd?).count).to eq(array.count)
      end
    end

    context 'when block is not given' do
      it 'returns nil' do
        expect(array.my_each).to be nil
      end
    end

    context 'when block is given' do
      it 'returns array changed by block' do
        expect(array.my_each { |a| a + 1 }).to eq([2, 3, 4])
      end

      it 'changes the original array' do
        array.my_each { |a| a + 1 }
        expect(array).not_to eq([1, 2, 3])
      end
    end
  end
end
