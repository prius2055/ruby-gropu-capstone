require_relative '../author'

describe Author do
  let(:author) { Author.new('Samuel', 'King') }

  it 'should print the author\'s first name' do
    expect(author.first_name).to eq('Samuel')
  end

  it 'should print the author\'s last name' do
    expect(author.last_name).to eq('King')
  end

  it 'should print the full name of the author' do
    expect(author.full_name).to eq('Samuel King')
  end
end
