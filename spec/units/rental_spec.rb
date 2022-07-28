require_relative '../../library/rental'

describe 'A rental' do
  def new_rental
    person_mock = double('Person', { rentals: [], name: 'Andres' })
    allow(person_mock).to receive(:save_rental)

    book_mock = double('Book', { rentals: [], title: 'The Analyst' })
    allow(book_mock).to receive(:save_rental)

    Rental.new('2022/07/27', book_mock, person_mock)
  end

  it 'Should store date' do
    rental = new_rental
    expect(rental.date).to eq('2022/07/27')
  end

  it 'Should store the book that was rented' do
    rental = new_rental
    expect(rental.book.title).to eq('The Analyst')
  end

  it 'Should store the person that rented the book' do
    rental = new_rental
    expect(rental.person.name).to eq('Andres')
  end
end
