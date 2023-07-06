require './app'
require './options'


def main
  app = App.new


  menu_actions = {
    1 => -> { app.list_all_books },
    2 => -> { app.list_all_labels },
    3 => -> { puts '3' },
    4 => -> { puts '4' },
    5 => -> { puts '5' },
    6 => -> { puts '6' },
    7 => -> { app.add_a_book },
    8 => -> { puts '8' },
    9 => -> { puts '9' },
    10 => lambda do
      puts 'Thank you for using this app. See you around soon!'
      break
    end
  }

  loop do
    options
    choice = gets.chomp.to_i

    if menu_actions.key?(choice)
      menu_actions[choice].call
      break if choice == 10
    else
      puts 'Invalid choice. Please enter a number from 1 to 10.'
    end

    puts "\n"
  end
end

main
