require_relative 'person'
require_relative 'decorator'
require_relative 'capitalize'
require_relative 'trimmer'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('Math')
student = Student.new(10, classroom)
puts "Student classroom: #{student.classroom}"
puts classroom.students

person = Person.new(22, 'maximilianus')
book1 = Book.new('title1', 'author1')
book2 = Book.new('title2', 'author2')

Rental.new('2022-01-01', book1, person)
Rental.new('2022-01-02', book2, person)

puts "Person rentals: #{person.rentals}"
puts "Renta del Book 1: #{book1.rentals}"
puts "Renta del Book 2: #{book2.rentals}"
