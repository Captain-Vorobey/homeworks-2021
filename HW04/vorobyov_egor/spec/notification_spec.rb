require '../lib/notification'

RSpec.describe Notification do
  subject { Notification.new('Boris accepted HW04') }

  describe '#new' do
    context 'when all parameters were passed' do
      it 'returns an object of notification class' do
        expect(subject).to eq subject
      end
    end

    context 'when parameters were not passed' do
      it 'raises ArgumentError' do
        expect { Notification.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.create_notification' do
    let(:notifications) { [] }

    context 'returns an array of notifications' do
      it 'when pushed valid notification' do
        expect(notifications.push(subject)).to eq notifications
      end
    end

    context 'returns an original array of notifications' do
      it 'when was not pushed notification' do
        expect(notifications).to eq notifications
      end
    end
  end
end
