# frozen_string_literal: true

require_relative './hw02'

using NewArrayMethods

describe 'my_each' do
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8] }

  context 'when testing My Each ' do
    it 'returns original array' do
      arr_each = arr.my_each { |x| x + 1 }
      expect(arr_each).to eq arr
    end
  end
end

describe 'my_map' do
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8] }
  let(:changed_arr) { [2, 3, 4, 5, 6, 7, 8, 9] }

  context 'when testing My Map' do
    it 'returns changed array' do
      arr_map = arr.my_map { |x| x + 1 }
      expect(arr_map).to eq changed_arr
    end
  end
end

describe 'my_select' do
  let(:arr) { [1, 2, 3, 4, 5, 6, 7, 8] }
  let(:new_arr) { [2, 4, 6, 8] }

  context 'when testing My Select' do
    it 'returns new array' do
      arr_select = arr.my_select(&:even?)
      expect(arr_select).to eq new_arr
    end
  end
end
