require_relative '../../library/teacher'

describe 'A teacher' do
  let(:teacher) { Teacher.new('Testing', 23, 'Andres') }
  it 'is a person' do
    expect(teacher.is_a?(Person)).to be(true)
  end
  it 'has a specialization' do
    expect(teacher.specialization).not_to be(nil)
  end
  it 'can use library services' do
    expect(teacher.can_use_services?).to be(true)
  end
end
