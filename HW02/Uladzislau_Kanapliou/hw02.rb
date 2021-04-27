# frozen_string_literal: true

# rubocop:disable Style/For
module MyArrayMethods
  refine Array do
    def my_each
      for i in 0...size
        yield(self[i])
      end
    end

    def my_select
      new_array = []
      for i in 0...size
        new_array << self[i] if yield(self[i])
      end
      new_array
    end

    def my_map
      new_array = []
      for i in 0...size
        new_array << yield(self[i])
      end
      new_array
    end
  end
end
# rubocop:enable Style/For