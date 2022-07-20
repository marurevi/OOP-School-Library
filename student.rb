require_relative './person'
require_relative './classroom'

# Student class
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  # accessor methods
  attr_accessor :classroom

  # public method
  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom = (classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.student.include?(self)
  end
end
