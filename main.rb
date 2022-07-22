require_relative './app'

class Main
  puts 'Welcome to the library system'
  app = App.new
  app.run
end

main = Main.new
main.run
