require('../my_array')

RSpec.describe MyArray do
  my_arr = MyArray.new([1, 2, 3, 4, 5])
  empty_arr = []

  describe '#select' do
    it 'returns an array of trueth values' do
      trueth_values = [2, 4]
      expect(my_arr.select { |el| el.even? }).to eq trueth_values
    end

    it "returns NoMethodError when block wasn't given" do
      expect { my_arr.select }.to raise_error(NoMethodError)
    end

    it 'returns an empty array when we got empty arr in input' do
      expect(empty_arr.select { |el| el.even? }).to be_empty
    end

    it "returns the original array with all original values when we don't have a conditional" do
      res = [1, 2, 3, 4, 5]
      expect(my_arr.select { |el| el + 1 }).to eq(res)
    end
  end

  describe '#each' do
    it 'returns an original array' do
      res = [1, 2, 3, 4, 5]
      expect(my_arr.each { |el| el *= 100 }).to eq res
    end

    it 'returns an empty array when we got empty arr in input' do
      expect(empty_arr.each { |el| el *= 100 }).to be_empty
    end

    it "returns NoMethodError when block wasn't given" do
      expect { my_arr.each }.to raise_error(NoMethodError)
    end
  end

  describe '#map' do
    it 'returns a new array' do
      new_arr = [100, 200, 300, 400, 500]
      expect(my_arr.map { |el| el *= 100 }).to eq new_arr
    end

    it "returns NoMethodError when block wasn't given" do
      expect { my_arr.map }.to raise_error(NoMethodError)
    end

    it 'returns an empty array when we got empty arr in input' do
      expect(empty_arr.map { |el| el *= 100 }).to be_empty
    end
  end
end
