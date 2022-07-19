require_relative './nameable'
require_relative './person'
require_relative './decorator'
require_relative './capitalize'
require_relative './trimmer'

person = Person.new(22, 'maximilianus')
person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# capitalizedTrimmedPerson.correct_name
