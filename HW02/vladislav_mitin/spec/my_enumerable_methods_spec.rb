require_relative '../my_enumerable_methods'

using MyEnumerableMethods

RSpec.describe MyEnumerableMethods do
  describe '#my_each' do
    context 'when was called without block' do
      subject { [1, 2, 3].my_each }

      it { is_expected.to be_an Enumerator }
    end

    context 'when was called with block' do
      subject { [1, 2, 3].my_each { _1 + 1 } }

      it { is_expected.to eq([1, 2, 3]) }
    end
  end

  describe '#my_map' do
    context 'when was called without block' do
      subject { [1, 2, 3].my_map }

      it { is_expected.to be_an Enumerator }
    end

    context 'when was called with block' do
      subject { [1, 2, 3].my_map { _1 + 1 } }

      it { is_expected.to eq([2, 3, 4]) }
    end
  end

  describe '#my_select' do
    context 'when was called without block' do
      subject { [1, 2, 3].my_select }

      it { is_expected.to be_an Enumerator }
    end

    context 'when was called with block' do
      subject { [1, 2, 3].my_select(&:even?) }

      it { is_expected.to eq([2]) }
    end
  end
end
