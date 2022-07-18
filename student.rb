require_relative './person'

# Student class
class Student < Person
  def initialize (name = 'Unknown', age, parent_permission = true, classroom)
    super(name, age, parent_permission, classroom)
    @classroom = classroom
  end
        
  # accessor methods
  attr_accessor :classroom

  # public method
  def play_hooky
    "¯\(ツ)/¯"
  end
  
end