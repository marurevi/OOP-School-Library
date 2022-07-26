require_relative './menu'

class MainMenu < Menu
  def display
    puts '=============================='
    puts 'Welcome to the library system'
    puts '=============================='
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '=============================='
    puts 'Enter your choice:'
  end
end
