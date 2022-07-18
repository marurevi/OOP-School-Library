require_relative './person'

# Teacher class
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # accessor methods
  attr_accessor :specialization

  # public method
  def can_use_services?
    true
  end
end