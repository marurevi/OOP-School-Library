require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @exit = false
  end

  def run
    user_input unless @exit == true
  end
  attr_accessor :books, :people, :rentals, :exit

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'No people in the library'
    else
      puts 'List of people:'
      @people.each do |person|
        puts "#{person.name} (id: #{person.id}), age: #{person.age}"
      end
    end
  end

  def list_rentals
    list_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @people.find { |prson| prson.id == id }
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    elsif person.rentals.empty?
      puts "No rentals for #{person.name}"
    else
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "#{rental.date} - #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def create_person(choice, age, name, specialization: nil, parent_permission: true)
    @people << Student.new(age, name, parent_permission: parent_permission) if choice == 1
    @people << Teacher.new(specialization, age, name) if choice == 2
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
