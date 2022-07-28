require_relative '../../library/classroom'

describe 'A classroom' do
  let(:classroom) { Classroom.new 'label' }
  it 'has a label' do
    expect(classroom.label.is_a?(String)).to be(true)
  end

  it 'can add a student' do
    mock = double('Student')
    allow(mock).to receive(:classroom=)
      .with(classroom)

    classroom.add_student(mock)
    expect(classroom.students).to include(mock)
  end
end
