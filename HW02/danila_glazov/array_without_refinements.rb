# frozen_string_literal: false

# Array class without refinements
class ArrayWithoutRefinements < Array
  def run
    self.my_each
    self.my_map
    self.my_select
  end
end
