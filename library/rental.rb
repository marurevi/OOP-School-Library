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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end

  def self.json_create(rental)
    new(rental['date'], rental['book'], rental['person'])
  end
end
