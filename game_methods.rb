require './game'
require './author'

class GameMethods
  attr_accessor :games, :authors

  def initialize
    @game = []
    @author = []
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

    puts 'Is it a multiplayer game? [Y/N]'
    multiplayer = gets.chomp.upcase

    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    end

    puts 'Enter the last palyed date of the game [YYYY-MM-DD]'
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer, last_played_at)
    @games << game

    author = Author.new(first_name, last_name)
    @authors << author

    author.add_items(game)

    puts "Game  '#{game.publish_date}', '#{game.multiplayer}, '#{game.last_played_at} added successfully"
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items include?(self)
  end
end
