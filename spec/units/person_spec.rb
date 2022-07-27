require_relative '../../library/person'

describe 'A person' do
  let(:person) { Person.new 15, 'Ana', parent_permission: true }

  it 'has an id' do
    expect(person.id).not_to be nil
  end

  it 'has an age' do
    expect(person.age).not_to be nil
  end

  it 'has a name' do
    expect(person.name).not_to be nil
  end

  context "when its name isn't known" do
    it "its name should be 'Unknown'" do
      person2 = Person.new 15, parent_permission: true
      expect(person2.name).to eq('Unknown')
    end
  end

  context 'Has parent permission or is on age' do
    it 'Can use the library service' do
      expect(person.can_use_services?).to be(true)
    end
  end
  context "Doesn't have parent permission and it's younger than 18 years old" do
    it "Can't use the library service" do
      person3 = Person.new 10, parent_permission: false
      expect(person3.can_use_services?).to be(false)
    end
  end
end
