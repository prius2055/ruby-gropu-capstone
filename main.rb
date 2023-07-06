require './app'
require './options'

def main
  app = App.new
  app.load_book

  menu_actions = {
    1 => -> { app.list_all_books },
    2 => -> { app.list_all_labels },
    3 => -> { app.list_all_music_albums },
    4 => -> { app.list_all_genres },
    5 => -> { app.list_games },
    6 => -> { app.list_authors },
    7 => -> { app.add_a_book },
    8 => -> { app.add_music_album },
    9 => -> { app.add_game },
    10 => lambda do
      app.save_book
      save_albums(app.music_methods.music_albums)
      save_data('./data/genre.json', array_to_hash(app.music_methods.genres))
      puts 'Thank you for using this app. See you around soon!'
      exit # Exit the app
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
