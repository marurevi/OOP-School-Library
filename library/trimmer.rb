require_relative './decorator'

# Create class Decorator
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end
