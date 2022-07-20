require_relative './book'

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @person.save_rental(self)
    @book.save_rental(self)
  end
end
