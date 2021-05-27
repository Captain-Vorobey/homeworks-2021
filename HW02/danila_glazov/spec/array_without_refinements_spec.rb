# frozen_string_literal: false
require './array_without_refinements'

describe ArrayWithoutRefinements do
  let(:standart_array) { described_class.new([1, 2, 3]) }

  describe '#run' do
    it 'raise an exeption' do
      expect { standart_array.run }.to raise_error(NoMethodError)
    end
  end
end
