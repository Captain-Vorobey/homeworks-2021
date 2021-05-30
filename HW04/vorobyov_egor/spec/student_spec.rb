require '../lib/student'
require '../lib/mentor'

RSpec.describe Student do
  let(:student) { Student.new('Egor', 'Vorobyov', 20) }
  let(:mentor) { Mentor.new('Boris', 'Tsarikov', 20) }
  let(:homework) { mentor.add_homework('HW04', 'code', 'some desc', student) }

  describe '#add_answer!' do
    context 'when valid parameters were passed' do
      it 'returns an answer from student to mentor about homework' do
        allow(Student).to receive(:add_answer!).with(homework: homework, mentor: mentor,
                                                     comment: double('How can I fix it and be merged to master?')).and_call_original
      end
    end

    context 'when parameters were not passed' do
      it 'raises ArgumentError' do
        expect { Notification.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#to_work!' do
    context 'when valid parameters were passed' do
      it 'returns done status of homework and send notification about it to mentor' do
        allow(homework).to receive(:status).and_return(:done)

        expect(homework.status).to eq :done
      end
    end
  end

  describe '#to_refactor!' do
    context 'when valid parameters were passed' do
      it 'returns pending_review status of homework' do
        allow(homework).to receive(:status).and_return(:pending_review)

        expect(homework.status).to eq :pending_review
      end
    end
  end

  describe '#to_check!' do
    context 'when valid parameters were passed' do
      it 'returns a notification to mentor' do
        notifications = double([])
        allow(notifications).to receive(:notification) { Notification.new('desc') }

        expect(notifications).to eq notifications
      end
    end
  end

  describe '#mark_as_read!' do
    let(:notifications) do
      student.notifications
    end

    context 'when student read all notifications' do
      it 'returns new status of notification' do
        notifications.each do |notification|
          expect(notification.read).to eq true
        end
      end
    end
  end

  describe '#done_homeworks' do
    context 'when valid parameters were passed' do
      it 'returns all done homeworks' do
        homework1 = double('homework')
        homework2 = double('homework')

        allow(homework1).to receive(:status).and_return(:approved)
        allow(homework2).to receive(:status).and_return(:approved)

        homeworks = [homework1, homework2]
        homeworks.each do |homework|
          expect(homework.status).to eq :approved
        end
      end
    end
  end
end
