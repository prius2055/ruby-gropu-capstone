require './game'
require './author'

class GameMethods
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def list_authors
    if @authors.empty?
      puts 'No authors available.'
    else
      puts 'List of authors: '
      @authors.each do |author|
        puts "First Name: #{author.first_name}"
        puts "Last Name: #{author.last_name}"
        puts '-----------------'
      end
    end
  end

  def list_games
    if @games.empty?
      puts 'No games available'

    else
      puts 'List of game: '
      @games.each do |game|
        puts "Multiplayer: #{game.multiplayer}"
        puts "Last played At: #{game.last_played_at}"
        puts "Publish Date: #{game.publish_date}"
        puts '------------------'
      end
    end
  end

  def add_game
    puts 'Enter First name of author'
    first_name = gets.chomp

    puts 'Enter Last name author'
    last_name = gets.chomp

    puts 'Enter the publish date of the game (YYYY-MM-DD)'
    publish_date = gets.chomp

    Time.now.year

    puts 'Is it a multiplayer game? [Y/N]'
    multiplayer = gets.chomp.upcase

    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    end

    puts 'Enter the last played date of the game [YYYY-MM-DD]'
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer, last_played_at)
    @games << game

    author = Author.new(first_name, last_name)
    @authors << author

    author.add_items(game)

    puts "Game  '#{game.publish_date}', '#{game.multiplayer}, '#{game.last_played_at} added successfully"
  end

  def save_game
    game_to_hash = games.map do |hash|
      {
        publish_date: hash.publish_date,
        multiplayer: hash.multiplayer,
        last_played_at: hash.last_played_at
      }
    end

    author_to_hash = authors.map do |hash|
      {

        first_name: hash.first_name,
        last_name: hash.last_name
      }
    end

    game_json = JSON.pretty_generate(game_to_hash)
    author_json = JSON.pretty_generate(author_to_hash)

    File.write('./database/games.json', game_json)
    File.write('./database/authors.json', author_json)
  end

  def load_game
    return [] unless File.exist?('./database/games.json')

    game_data = JSON.parse(File.read('./database/games.json'))
    @games.clear

    new_game = ''
    game_data.each do |game|
      publish_date = game['publish_date']
      multiplayer = game['multiplayer']
      last_played_at = game['last_played_at']

      game = Game.new(publish_date, multiplayer, last_played_at)
      new_game = game
      @games << game
    end

    return [] unless File.exist?('./database/authors.json')

    author_data = JSON.parse(File.read('./database/authors.json'))
    @authors.clear

    author_data.each do |author|
      first_name = author['first_name']
      last_name = author['last_name']

      author = Author.new(first_name, last_name)
      author.add_items(new_game)
      @authors << author
    end
  end
end
