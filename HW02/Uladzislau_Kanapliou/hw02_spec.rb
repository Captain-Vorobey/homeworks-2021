# frozen_string_literal: true

require 'pry'
require_relative './hw02'

using MyArrayMethods

describe MyArrayMethods do
  describe '.my_each' do
    context 'array is not empty' do
      subject { [1, 2, 3, 4, 5] }

      it 'iterates through array' do
        sum = 0
        subject.my_each { sum += 1 }
        expect(sum).to eq(subject.size)
      end

      it 'passes each element through pipe' do
        result = []
        subject.my_each { |el| result << el }
        expect(result).to eq(subject)
      end

      it 'returns array itself' do
        expect(subject.my_each {}).to eq(subject)
      end

      it 'returns array itself if block not given' do
        expect(subject.my_each).to eq(subject)
      end

      it 'raise exception when block contains exception' do
        expect { subject.my_each { raise StandardError } }.to raise_error(StandardError)
      end
    end
  end

  describe '.my_map' do
    context 'array is not empty' do
      subject { [1, 2, 3, 4, 5] }

      it 'iterates through array' do
        sum = 0
        subject.my_map { sum += 1 }
        expect(sum).to eq(subject.size)
      end

      it 'passes each element through pipe' do
        result = []
        subject.my_map { |el| result << el }
        expect(result).to eq(subject)
      end

      it 'returns new array with nil values' do
        result = [nil, nil, nil, nil, nil]
        expect(subject.my_map {}).to eq(result)
      end

      it 'raise exception when block contains exception' do
        expect { subject.my_map { raise StandardError } }.to raise_error(StandardError)
      end

      it 'works like map' do
        result = subject.map {|el| el.odd? }
        expect(subject.my_map { |el| el.odd? }).to eq(result)
      end
    end
  end

  describe '.my_select' do
    context 'array is not empty' do
      subject { [1, 2, 3, 4, 5] }

      it 'iterates through array' do
        sum = 0
        subject.my_select { sum += 1 }
        expect(sum).to eq(subject.size)
      end

      it 'passes each element through pipe' do
        result = []
        subject.my_select { |el| result << el }
        expect(result).to eq(subject)
      end

      it 'returns new empty array' do
        expect(subject.my_select {}).to eq([])
      end

      it 'raise exception when block contains exception' do
        expect { subject.my_select { raise StandardError } }.to raise_error(StandardError)
      end

      it 'works like select' do
        result = subject.select{|el| el.odd?}
        expect(subject.my_select { |el| el.odd? }).to eq(result)
      end
    end
  end
end
