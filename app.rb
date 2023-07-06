require './book_methods'

class App
  ##----------MEMBER 1------------##
  attr_accessor :book_methods, :game_methods

  def initialize
    @book_methods = BookMethods.new
    @game_methods = GameMethods.new
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
  ####################################

  def list_games
    game_methods.list_games
  end

  def list_authors
    game_methods.list_authors
  end

  def add_game
    game_methods.add_game
  end
######################################
end

