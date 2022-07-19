require_relative './person'
require_relative './capitalize'
require_relative './trimmer'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalizedTrimmed_person = TrimmerDecorator.new(capitalized_person)
capitalizedTrimmed_person.correct_name
