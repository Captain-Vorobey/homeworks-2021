# frozen_string_literal: true

module MyArrayMethod
  refine Array do
    def my_map
      my_arr = []
      for i in 0...size
        my_arr << yield(self[i])
      end
      my_arr
    end

    def my_each
      for i in 0...size
        yield(self[i])
      end
      self
    end

    def my_select
      arr = []
      for i in 0...size
        arr << self[i] if yield(self[i])
      end
      arr
    end
  end
end
