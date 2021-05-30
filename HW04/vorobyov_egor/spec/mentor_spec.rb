require('../lib/mentor')
require('../lib/student')

RSpec.describe Mentor do
  let(:student) { Student.new('Egor', 'Vorobyov', 20) }
  let(:mentor) { Mentor.new('Boris', 'Tsarikov', 20) }

  describe '#add_homework' do
    context 'when mentor added new homework to students' do
      let(:homeworks) { student.homeworks }

      it 'returns a homework' do
        allow(Homework).to receive(:new).with(title: 'title', description: 'desc',
                                              student: double('student')).and_call_original
        allow(Notification).to receive(:new).with(title: 'title', description: 'desc',
                                                  student: double('student')).and_call_original
        expect(homeworks.push(double('homework'))).to eq homeworks
      end
    end
  end

  describe '#subscribe_to!' do
    let(:students) { [] }

    context 'when student was passed like parameter' do
      it 'returns an array of students which mentor has' do
        expect(students.push(student)).to eq students
      end
    end

    context 'when student was not passed' do
      it 'returns original array of students' do
        expect(students).to eq []
      end
    end
  end

  describe '#reject_to_work!' do
    context 'when mentor checked student homework' do
      it 'returns a rejected status of homework' do
        homework = double('homework')
        allow(homework).to receive(:status).and_return(:rejected)

        expect(homework.status).to eq :rejected
      end
    end
  end

  describe '#accept!' do
    context 'when mentor approved student homework' do
      it 'returns a approved status of homework' do
        homework = double('homework')
        allow(homework).to receive(:status).and_return(:approved)

        expect(homework.status).to eq :approved
      end
    end
  end

  describe '#mark_as_read!' do
    let(:notifications) do
      mentor.notifications
    end

    context 'when mentor read all notifications' do
      it 'returns new status of notification' do
        notifications.each do |notification|
          expect(notification.read).to eq true
        end
      end
    end
  end

  describe '#subscribe_to?' do
    let(:subscribed) { mentor.subscribe_to!(student) }

    context 'when mentor subscribed on student' do
      it 'returns true' do
        expect(subscribed ? true : false).to eq true
      end
    end
  end
end
