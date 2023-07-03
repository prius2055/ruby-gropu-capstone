def display_menu
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
  puts 'Enter your choice (1-10):'
end

def process_choice(choice)
  actions = {
    1 => 'All books',
    2 => 'All labels',
    3 => 'All music albums',
    4 => 'All genres',
    5 => 'All games',
    6 => 'All authors',
    7 => 'Add a book',
    8 => 'Add a music album',
    9 => 'Add a game',
    10 => 'Thank you for using this app. See you around soon!'
  }

  if actions.key?(choice)
    puts actions[choice]
    return choice == 10
  end

  puts 'Invalid choice. Please enter a number from 1 to 10.'
  false
end

def main
  loop do
    display_menu

    choice = gets.chomp.to_i

    break if process_choice(choice)

    puts "\n"
  end
end
