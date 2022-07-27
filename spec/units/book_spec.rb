require_relative '../../library/book'

describe 'A book' do
  let(:book) { Book.new('The Hobbit', 'J.R.R. Tolkien') }

  it 'should have a title' do
    expect(book.title).to eq('The Hobbit')
  end

  it 'should have an author' do
    expect(book.author).to eq('J.R.R. Tolkien')
  end
end
