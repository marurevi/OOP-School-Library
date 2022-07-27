require_relative './menu'

class ListRentalsMenu < Menu
  def initialize(app)
    super()
    @app = app
  end

  def display
    @app.list_people
    puts 'Enter person id:'
    id = gets.chomp
    person = @app.people.find { |prson| prson.id == id }
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    elsif person.rentals.empty?
      puts "No rentals for #{person.name}"
    else
      puts "Rentals for #{person.name}:"
      @app.list_rentals(person)
    end
  end
end
