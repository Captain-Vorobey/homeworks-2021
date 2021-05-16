require('../my_array')

RSpec.describe MyArray do
  my_arr = MyArray.new([1, 2, 3, 4, 5])

  describe '#select' do
    it 'should return an array of trueth values' do
      trueth_values = [2, 4]
      expect(my_arr.select { |el| el.even? }).to eq trueth_values
    end
  end

  describe '#each' do
    it 'should return an original array' do
      res = [1, 2, 3, 4, 5]
      expect(my_arr.each { |el| el *= 100 }).to eq res
    end
  end

  describe '#map' do
    it 'should return a new array' do
      new_arr = [100, 200, 300, 400, 500]
      expect(my_arr.map { |el| el *= 100 }).to eq new_arr
    end
  end
end
