require './book_methods'
require './game_methods'
require_relative 'music_methods'
require_relative 'storage'


class App
  include Storage
  attr_accessor :book_methods, :game_methods, :music_methods

  def initialize
    @book_methods = BookMethods.new
    @game_methods = GameMethods.new
    @music_methods = MusicMethods.new
  end

  def list_all_books
    book_methods.list_all_books
  end

  def list_all_labels
    book_methods.list_all_labels
  end

  def add_a_book
    book_methods.add_a_book
  end

  def save_book
    book_methods.save_book
  end

  def load_book
    book_methods.load_book
  end

  def list_games
    game_methods.list_games
  end

  def list_authors
    game_methods.list_authors
  end

  def add_game
    game_methods.add_game
  end

  def list_all_music_albums
    music_methods.list_all_music_albums
  end

  def list_all_genres
    music_methods.list_all_genres
  end

  def add_music_album
    music_methods.add_music_album
  end

  def find_or_create_genre
    music_methods.find_or_create_genre
  end
end
