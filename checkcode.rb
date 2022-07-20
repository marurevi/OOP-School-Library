require_relative './nameable'
require_relative './person'
require_relative './decorator'
require_relative './capitalize'
require_relative './trimmer'
require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# capitalizedTrimmedPerson.correct_name

classroom = Classroom.new('Math')
student = Student.new(10, classroom)
puts student.classroom
puts classroom.students

person = Person.new(22, 'maximilianus')
book1 = Book.new('title1', 'author1')
book2 = Book.new('title2', 'author2')

Rental.new('2022-01-01', book1, person)
Rental.new('2022-01-02', book2, person)

puts person.rentals
puts book1.rentals
puts book2.rentals
