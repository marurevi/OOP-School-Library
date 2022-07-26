require_relative './menu'

class CreatePersonMenu < Menu
  def initialize(app)
    @app = app
  end
  def display
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
        @app.create_person(choice, age, name, parent_permission: parent_permission?(permission))
      when 2
        puts 'Enter specialization:'
        specialization = gets.capitalize.chomp
        @app.create_person(choice, age, name, specialization: specialization)
      else
        puts 'Invalid choice, please try again'
    end
  end
  private
  
  def parent_permission?(permission)
    true if permission == 1 
    false if permission == 2  
  end
end