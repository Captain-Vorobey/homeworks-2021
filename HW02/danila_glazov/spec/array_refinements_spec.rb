# frozen_string_literal: false
require './array_refinements'
using ArrayRefinements

describe ArrayRefinements do
  let(:test_array) { [1, 2, 3] }
  let(:non_arrays) { ['', 1, 1.0, true, false, nil, {}, :sym] }

  describe '#my_each' do
    context 'when no block passed' do
      it 'return an initial array' do
        expect(test_array.my_each).to eq([1, 2, 3])
      end
    end

    context 'when block passed' do
      it 'execute block for each element' do
        expect { test_array.my_each { |el| puts el } }.to output("1\n2\n3\n").to_stdout
        expect { test_array.my_each { |el| print el } }.to output('123').to_stdout
        expect { test_array.my_each { |el| p el } }.to output("1\n2\n3\n").to_stdout
      end

      it 'return an initial array' do
        expect(test_array.my_each { |el| puts el }).to eq([1, 2, 3])
      end
    end

    context 'when called on non array object' do
      it 'raises an exception' do
        non_arrays.each do |el|
          expect { el.my_each }.to raise_error(NoMethodError)
        end
      end
    end
  end

  describe '#my_map' do
    context 'when no block passed' do
      it 'return an initial array' do
        expect(test_array.my_map).to eq([1, 2, 3])
      end
    end

    context 'when block passed' do
      it 'return a new array object' do
        expect(test_array.my_map { |el| el + 1 }.object_id == test_array.object_id).to eq(false)
      end

      it 'return a modifyed array' do
        expect(test_array.my_map { |el| el + 1 }).to eq([2, 3, 4])
      end
    end

    context 'when called on non array object' do
      it 'raises an exception' do
        non_arrays.each do |el|
          expect { el.my_map }.to raise_error(NoMethodError)
        end
      end
    end
  end

  describe '#my_select' do
    context 'when no block passed' do
      it 'return an initial array' do
        expect(test_array.my_select).to eq([1, 2, 3])
      end
    end

    context 'when block passed' do
      it 'return a new array object' do
        expect(test_array.my_select(&:odd?).object_id == test_array.object_id).to eq(false)
      end

      it 'return an array that satisfies the condition in the block' do
        expect(test_array.my_select(&:odd?)).to eq([1, 3])
      end
    end

    context 'when called on non array object' do
      it 'raises an exception' do
        non_arrays.each do |el|
          expect { el.my_select }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
