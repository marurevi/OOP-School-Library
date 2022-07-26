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
    if @books.empty?
      puts 'No books in the library'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "#{book.title} by #{book.author}"
      end
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

  def create_person
    puts 'Do you want to create a student [1] or a teacher [2]?'
    choice = gets.chomp.to_i
    puts 'Enter name:'
    name = gets.capitalize.chomp
    puts 'Enter age:'
    age = gets.chomp.to_i

    case choice
    when 1
      puts 'Enter parent permission (yes [1] /no [2]):'
      permission = gets.chomp.to_i
      @people << if permission == 1
                   Student.new(age, name, parent_permission: true)
                 else
                   Student.new(age, name, parent_permission: false)
                 end
    when 2
      puts 'Enter specialization:'
      specialization = gets.capitalize.chomp
      @people << Teacher.new(specialization, age, name)
    else
      puts 'Invalid choice, please try again'
    end
  end

  def create_book
    puts 'Enter title:'
    title = gets.capitalize.chomp
    puts 'Enter author:'
    author = gets.capitalize.chomp
    book = Book.new(title, author)
    @books << book
  end

  def create_rental
    list_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @people.find { |prson| prson.id == id }
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    else
      list_books
      puts 'Enter book title:'
      title = gets.capitalize.chomp
      book = @books.find { |bk| bk.title == title }
      if book.nil?
        puts "Book with title: #{title} not found, please try again"
      else
        puts 'Enter rental date (YYYY-MM-DD):'
        date = gets.chomp
        rental = Rental.new(date, book, person)
        @rentals << rental
      end
    end
  end
end
