require_relative './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rental = Rental.new(date, self, person)
  end

  def save_rental(rental)
    @rentals.push(rental)
  end
end
