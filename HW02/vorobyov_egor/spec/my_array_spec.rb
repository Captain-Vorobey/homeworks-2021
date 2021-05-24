require('../my_array')

RSpec.describe MyArray do
  subject { MyArray.new([1, 2, 3, 4, 5]) }

  let(:result_array) { [1, 2, 3, 4, 5] }

  describe '#select' do
    context 'when passed valid block' do
      let(:expected_array) { [2, 4] }

      it 'returns an array of trueth values' do
        expect(subject.select { |el| el.even? }).to eq expected_array
      end
    end

    context 'when block was not given' do
      it 'returns NoMethodError' do
        expect { subject.select }.to raise_error(NoMethodError)
      end
    end

    context 'when passed an empty arr' do
      let(:empty_arr) { [] }

      it 'returns an empty array' do
        expect(empty_arr.select { |el| el.even? }).to be_empty
      end
    end

    context 'when passed invalid block' do
      it "returns the original array with all original values when we don't have a conditional" do
        expect(subject.select { |el| el + 1 }).to eq(result_array)
      end
    end
  end

  describe '#each' do
    context 'when passed valid block' do
      it 'returns an original array' do
        expect(subject.each { |el| el *= 100 }).to eq result_array
      end
    end

    context 'when passed an empty arr' do
      let(:empty_arr) { [] }

      it 'returns an empty array' do
        expect(empty_arr.each { |el| el *= 100 }).to be_empty
      end
    end

    context 'when block was not given' do
      it 'returns NoMethodError' do
        expect { subject.each }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#map' do
    context 'when passed valid block' do
      let(:expected_array) { [100, 200, 300, 400, 500] }

      it 'returns a new array' do
        expect(subject.map { |el| el *= 100 }).to eq expected_array
      end
    end

    context 'when block was not given' do
      it 'returns NoMethodError' do
        expect { subject.map }.to raise_error(NoMethodError)
      end
    end

    context 'when passed an empty arr' do
      let(:empty_arr) { [] }

      it 'returns an empty array' do
        expect(empty_arr.map { |el| el *= 100 }).to be_empty
      end
    end
  end
end
