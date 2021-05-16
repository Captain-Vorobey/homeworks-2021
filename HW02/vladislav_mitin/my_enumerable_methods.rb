module MyEnumerableMethods
  refine Array do
    def my_each
      if block_given?
        length.times { |i| yield self[i] }

        self
      else
        to_enum :my_each
      end
    end

    def my_map
      res = []

      if block_given?
        length.times { |i| res << yield(self[i]) }
      else
        res = to_enum :my_map
      end

      res
    end

    def my_select
      res = []

      if block_given?
        length.times { |i| res << self[i] if yield(self[i]) }
      else
        res = to_enum :my_select
      end

      res
    end
  end
end
