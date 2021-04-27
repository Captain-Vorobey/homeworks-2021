# frozen_string_literal: true

# defined the module which class we are refining, whith an new name
module ArrayRefine
  refine Array do
    def my_map
      new_array = []
      if block_given?
        i = 0
        while i < length
          new_array[i] = yield self[i]
          i += 1
        end
      end
      new_array
    end

    def my_select
      new_array = []
      if block_given?
        i = 0
        while i < length
          new_array << self[i] if yield self[i]
          i += 1
        end
      end
      new_array
    end

    def my_each
      if block_given?
        i = 0
        while i < length
          yield self[i]
          i += 1
        end
      end
      self
    end
  end
end
