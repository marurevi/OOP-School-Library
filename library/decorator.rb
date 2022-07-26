require_relative './nameable'

# Create class Decorator
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # Accessor method
  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end
