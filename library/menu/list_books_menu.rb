require_relative './menu'

class ListBooksMenu < Menu
  def initialize(app)
    super()
    @app = app
  end

  def display
    if @app.books.empty?
      puts 'No books in the library'
    else
      puts 'List of books:'
      @app.list_books
    end
  end
end
