require_relative './nameable.rb'
require_relative './person.rb'
require_relative './decorator.rb'
require_relative './capitalize.rb'
require_relative './trimmer.rb'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name