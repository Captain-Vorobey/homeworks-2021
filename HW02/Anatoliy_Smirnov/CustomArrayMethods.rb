# HomeWork 2. Creation of customs methods for each, select, map.
module CustomArrayMethods
  refine Array do
    def array_each
     for l_cnt in 0...size
       yield(self[l_cnt])
     end
    end

    def array_select
      l_new_array = []
      size.times do |l_cnt|
        for l_cnt in 0...size
          l_new_array << self[l_cnt] if yield(self[l_cnt])
        end
        l_new_array
      end
    end

    def array_map
      l_new_array = []
        for l_cnt in 0...size
          l_new_array << yield(self[l_cnt])
        end
      l_new_array
    end
  end
end

