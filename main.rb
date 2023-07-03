def main
  loop do
    puts 'School Library System'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. List all music albums'
    puts '4. List all genres'
    puts '5. List all games'
    puts '6. List all authors'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '10. Exit'
    puts 'Enter your choice (1-4):'

    choice = gets.chomp.to_i

    case choice
    when 1
      puts 'All books'
    when 2
      puts 'All books7'
    when 3
      puts 'Add new movie'
    when 4
      puts 'Add new Genre'
    when 5
      puts 'Add new '
    when 6
      puts ' new book'
    when 7
      puts 'Add book'
    when 8
      puts 'Add new book5'
    when 9
      puts 'Add new book3'
    when 10
      puts 'Thank you for using this app. See you around soon!'
      break
    else
      puts 'Invalid choice. Please enter a number from 1 to 7.'
    end

    puts "\n"
  end
end
