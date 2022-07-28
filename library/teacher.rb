require_relative './person'

# Teacher class
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  # accessor methods
  attr_accessor :specialization

  # public method
  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(teacher)
    new(teacher['specialization'], teacher['age'], teacher['name'], id: teacher['id'])
  end
end
