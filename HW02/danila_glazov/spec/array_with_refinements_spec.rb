# frozen_string_literal: false
require './array_with_refinements'

describe ArrayWithRefinements do
  let(:refined_array) { described_class.new([1, 2, 3]) }

  describe '#run' do
    it 'return with success' do
      expect { refined_array.run }.not_to raise_error
    end
  end
end
