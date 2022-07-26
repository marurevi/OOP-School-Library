require_relative './menu'

class ListPeopleMenu < Menu
  def initialize(app)
    super()
    @app = app
  end

  def display
    if @app.people.empty?
      puts 'No people in the library'
    else
      puts 'List of people:'
      @app.list_people
    end
  end
end
