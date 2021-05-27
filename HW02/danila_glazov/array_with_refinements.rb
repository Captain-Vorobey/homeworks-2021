# frozen_string_literal: false
require './array_refinements'

# Array class with refinements
class ArrayWithRefinements < Array
  using ArrayRefinements

  def run
    self.my_each
    self.my_map
    self.my_select
  end
end
