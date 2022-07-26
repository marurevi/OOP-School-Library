require_relative './menu'

class CreateRentalMenu < Menu
  def initialize(app)
    super()
    @app = app
  end

  def display
    @app.list_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @app.people.find { |prson| prson.id == id }
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    else
      @app.list_books
      puts 'Enter book title:'
      title = gets.capitalize.chomp
      book = @app.books.find { |bk| bk.title == title }
      if book.nil?
        puts "Book with title: #{title} not found, please try again"
      else
        puts 'Enter rental date (YYYY-MM-DD):'
        date = gets.chomp
        @app.create_rental(date, book, person)
      end
    end
  end
end
