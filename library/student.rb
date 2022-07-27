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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(student)
    new(student['age'], student['name'], parent_permission: student['parent_permission'], id: student['id'])
  end
end
