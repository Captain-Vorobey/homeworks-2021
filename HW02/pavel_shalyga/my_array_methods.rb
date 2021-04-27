module MyArrayMethods
  refine Array do
    def my_each
      for index in (0...length)
        yield(self[index]) if block_given?
      end
      self
    end

    def my_select
      if block_given?
        array = []
        for index in (0...length)
          array << self[index] if yield(self[index])
        end
        array
      else
        self
      end
    end

    def my_map
      if block_given?
        array = []
        for index in (0...length)
          array << yield(self[index])
        end
        array
      else
        self
      end
    end
  end
end
