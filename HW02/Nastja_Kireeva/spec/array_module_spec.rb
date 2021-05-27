# frozen_string_literal: true

require_relative '../array_module'

using ArrayModule

RSpec.describe ArrayModule do
  let(:empty_array) { [] }
  let(:array) { [1, 2, 3, 4, 5, 6] }

  describe '#my_empty?' do
    context 'when array is not empty' do
      it 'returns false' do
        expect(array.my_empty?).to be false
      end
    end

    context 'when array is empty' do
      it 'returns true' do
        expect(empty_array.my_empty?).to be true
      end
    end
  end

  describe '#my_map' do
    context 'when block is given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_map(&:even?)).to be_empty
        end
      end

      context 'when array is not empty' do
        let(:new_array) { [3, 6, 9, 12, 15, 18] }

        it 'returns a modified array' do
          expect(array.my_map { |element| element * 3 }).to eq new_array
        end

        it 'does not affect the original array' do
          expect(array.my_map(&:even?).object_id).not_to eq array.object_id
        end
      end
    end

    context 'when block is not given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_map).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns LocalJumpError' do
          expect { array.my_map }.to raise_error(LocalJumpError)
        end
      end
    end
  end

  describe '#my_each' do
    context 'when block is given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_each(&:even?)).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns the array' do
          expect(array.my_each {}).to eq array
        end

        it 'returns the same array' do
          expect(array.my_each(&:even?).object_id).to eq array.object_id
        end
      end
    end

    context 'when block is not given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_each).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns LocalJumpError' do
          expect { array.my_each }.to raise_error(LocalJumpError)
        end
      end
    end
  end

  describe '#my_select' do
    context 'when block is given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_select(&:even?)).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns a new array of elements for which the block conditions are true' do
          expect(array.my_select(&:even?)).to eq([2, 4, 6])
        end

        it 'does not affect the original array' do
          expect(array.my_select(&:even?).object_id).not_to eq array.object_id
        end
      end
    end

    context 'when block is not given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_select).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns LocalJumpError' do
          expect { array.my_select }.to raise_error(LocalJumpError)
        end
      end
    end
  end

  describe '#my_reject' do
    context 'when block is given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_reject(&:even?)).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns a new array of elements for which the block conditions are false' do
          expect(array.my_reject(&:even?)).to eq([1, 3, 5])
        end

        it 'does not affect the original array' do
          expect(array.my_reject(&:even?).object_id).not_to eq array.object_id
        end
      end
    end

    context 'when block is not given' do
      context 'when array is empty' do
        it 'returns an empty array' do
          expect(empty_array.my_reject).to be_empty
        end
      end

      context 'when array is not empty' do
        it 'returns LocalJumpError' do
          expect { array.my_reject }.to raise_error(LocalJumpError)
        end
      end
    end
  end

  describe '#my_count' do
    context 'when block is given' do
      context 'when array is empty' do
        it 'returns zero result' do
          expect(empty_array.my_count(&:even?)).to eq(0)
        end
      end

      context 'when array is not empty' do
        it 'returns the number of elements for which the block returns a true value' do
          expect(array.my_count(&:even?)).to eq(3)
        end
      end
    end

    context 'when block is not given' do
      context 'when array is empty' do
        it 'returns zero result' do
          expect(empty_array.my_count).to eq(0)
        end
      end

      context 'when array is not empty' do
        it 'returns LocalJumpError' do
          expect { array.my_count }.to raise_error(LocalJumpError)
        end
      end
    end
  end
end
