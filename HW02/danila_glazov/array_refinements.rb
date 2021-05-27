# frozen_string_literal: false

# My own implementation of array methods
module ArrayRefinements
  refine Array do
    def my_each
      if block_given?
        (0...length).each do |i|
          yield self[i]
        end
      end

      self
    end

    def my_map
      new_arr = []
      if block_given?
        (0...length).each do |i|
          new_arr.push yield self[i]
        end
        return new_arr
      end

      self
    end

    def my_select
      new_arr = []
      if block_given?
        (0...length).each do |i|
          new_arr.push self[i] if yield self[i]
        end
        return new_arr
      end

      self
    end
  end
end
