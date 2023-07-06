require_relative '../book'

describe '#can_be_archived?' do
  it 'returns true when move_to_archive is true' do
    book = Book.new('John Doe', '2022-01-01', false, 'ABC Publishing', 'good')
    allow(book).to receive(:move_to_archive).and_return(true)
    expect(book.send(:can_be_archived?)).to be_truthy
  end

    it "sets archived to true when cover_state is 'bad'" do
    cover_state = 'bad'
    book = Book.new('John Doe', 'Publisher XYZ', '2022-01-01', true, 'ABC Publishing', cover_state)
    expect(book.archived).to be_truthy
  end
end
