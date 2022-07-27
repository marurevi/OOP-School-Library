require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require 'json'

class App
  def initialize
    books = File.file?('data/books.json') ? read_data('data/books.json') : {}
    people = File.file?('data/people.json') ? read_data('data/people.json') : {}
    rentals = File.file?('data/rentals.json') ? read_data('data/rentals.json') : {}

    @books = books['books'] || []
    @people = people['people'] || []
    @rentals = rentals['rentals'] || []
    @exit = false
  end
  
  def read_data(file)
    File.open(file) { |f| JSON.parse(f.read, create_additions: true)}
  end

  def write_data
    files = [
      { name: 'books', data: @books },
      { name: 'people', data: @people },
      { name: 'rentals', data: @rentals }    
    ]

    files.each do |file|
      File.open("data/#{file[:name]}.json", 'w') do |f|
        data_hash = { file[:name] => file[:data] }
        json = JSON.pretty_generate(data_hash)
        f.write(json)
      end
    end
  end

  def run
    user_input unless @exit == true
  end
  attr_accessor :books, :people, :rentals, :exit

  def list_books
    @books.each do |book|
      puts "`#{book.title} by #{book.author}`"
    end
  end

  def list_people
    @people.each do |person|
      puts "`#{person.name} (id: #{person.id}), age: #{person.age}`"
    end
  end

  def list_rentals(person)
    person.rentals.each do |rental|
      puts "`#{rental.date} - #{rental.book.title} by #{rental.book.author}`"
    end
  end

  def create_person(choice, age, name, specialization: nil, parent_permission: true, id: nil)
    @people << Student.new(age, name, parent_permission: parent_permission, id: id) if choice == 1
    @people << Teacher.new(specialization, age, name, id: id) if choice == 2
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end
end
