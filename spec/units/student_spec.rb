require_relative '../../library/student'

describe 'A student' do
  let(:student) { Student.new 10, 'Peter' }
  it 'is a person' do
    expect(student.is_a?(Person)).to be(true)
  end
  it 'play hocky' do
    expect(student.play_hooky).to eq("¯\(ツ)/¯")
  end
  it 'has asigned a classroom' do
    mock = double('Classroom')
    allow(mock).to receive(:add_student)
      .with(student)

    allow(mock).to receive(:students)
      .and_return([])

    student.classroom = mock
    expect(student.classroom).not_to be(nil)
  end
end
