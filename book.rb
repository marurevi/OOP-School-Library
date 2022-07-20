class Book 
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals ||= []
  end

  def add_rental(date, book, person)
    @rental = Rental.new(date, book, person)
    @rentals.push(rental)
    @rental.student = person
    @rentals.book = book
  end
end