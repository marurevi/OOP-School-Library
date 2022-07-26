require_relative './person'
require_relative './classroom'

# Student class
class Student < Person
  attr_reader :classroom

  # public method
  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.student.include?(self)
  end
end
