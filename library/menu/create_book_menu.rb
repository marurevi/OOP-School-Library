require_relative './menu'

class CreateBookMenu < Menu
  def initialize(app)
    super()
    @app = app
  end

  def display
    puts 'Enter title:'
    title = gets.capitalize.chomp
    puts 'Enter author:'
    author = gets.capitalize.chomp
    @app.create_book(title, author)
  end
end
