require './app'
require './options'


# def main
#   app = App.new
#   app.load_book


#   loop do
#     options
#     choice = gets.chomp.to_i

#     case choice
#     when 1
#       app.list_all_books
#     when 2
#       app.list_all_labels
#     when 3
#       puts '3'
#     when 4
#       puts '4'
#     when 5
#       puts '5'
#     when 6
#       puts '6'
#     when 7
#       app.add_a_book
#     when 8
#       puts '8'
#     when 9
#       puts '9'
#     when 10
#       app.save_book
#       puts 'Thank you for using this app. See you around soon!'
#       break
#     else
#       puts 'Invalid choice. Please enter a number from 1 to 7.'
#     end

#     puts "\n"
#   end
# end



def main
  app = App.new
  app.load_book

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
      app.save_book
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
