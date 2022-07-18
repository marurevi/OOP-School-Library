# Create class Person
class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.new.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # accessor get methods
  attr_reader :id

  # accessor set methods
  attr_accessor :name, :age, :parent_permission

  # private method
  def of_age?
    @age >= 18
  end

  private :of_age?

  # public method
  def can_use_services?
    of_age? || @parent_permission
  end
end
