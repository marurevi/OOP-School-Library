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
    user_input until @exit
  end

  private

  def display_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def user_input
    display_options
    puts 'Enter your choice:'
    choice = gets.chomp.to_i
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      @exit = true
    else
      puts 'Invalid choice'
    end
  end

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "#{person.name} (id: #{person.id}), age: #{person.age}"
    end

  def list_rentals
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @people.find { |person| person.id == id }
    if person
      if person.rentals
        person.rentals.each do |rental|
            puts "#{rental.date} - #{rental.book.title} by #{rental.book.author}"
        end
      else
        puts 'No rentals'
      end
    else
        puts "Person with id: #{id} not found, please try again"
    end
  end

  def create_person
    puts 'Enter name:'
    name = gets.capitalize.chomp
    puts 'Enter age:'
    age = gets.chomp.to_i
    person = Person.new(age, name)
    @people << person
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
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @people.find { |person| person.id == id }
    
    if person
        puts 'Enter book title:'
        title = gets.capitalize.chomp
        book = @books.find { |book| book.title == title }
        if book
            rental = Rental.new(Date.today, book, person)
            @rentals << rental
        else
            puts "Book with title: #{title} not found, please try again"
        end
    else
        puts "Person with id: #{id} not found, please try again"
    end
  end
end
