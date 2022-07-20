require_relative './nameable'

# Create class Person
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.new.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  # accessor get methods
  attr_reader :id, :rentals

  # accessor set methods
  attr_accessor :name, :age, :parent_permission

  # private method
  def of_age?
    @age >= 18
  end

  def save_rental(rental)
    @rentals.push(rental)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private :of_age?

  # public method
  def can_use_services?
    of_age? || @parent_permission
  end
end
