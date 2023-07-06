require './book'
require './label'
require 'json'

class BookMethods
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def list_all_books
    puts 'List of books:'
    if @books.empty?
      puts 'No books found.'
    else
      @books.each { |book| puts "#{book.author}'s book, published in #{book.publish_date}" }
    end
  end

  def list_all_labels
    puts 'List of labels:'
    if labels.empty?
      puts 'No labels found'
    else
      labels.each { |label_item| puts "#{label_item.title},#{label_item.color}" }
    end
  end

  def add_a_book
    puts 'Enter the book author:'
    author = gets.chomp

    puts 'Enter book publisher:'
    publisher = gets.chomp

    puts 'Enter book publication Year:'
    publish_date = gets.chomp.to_i

    archived = Time.now.year - publish_date > 10

    puts 'Choose book cover state[Good/Bad]:'
    cover_state = gets.chomp

    puts 'Choose a suitable title for the library:'
    title = gets.chomp

    puts 'Choose a suitable color for the library:'
    color = gets.chomp

    book_item = Book.new(author, publish_date, archived, publisher, cover_state)
    @books.push(book_item)

    new_label_item = Label.new(title, color)
    new_label_item.add_item(book_item)
    @labels.push(new_label_item)
    puts "New book by #{book_item.author} published by #{book_item.publisher} added successfully"
  end

  def save_book
    book_to_hash = books.map do |hash|
      {
        author: hash.author,
        cover_state: hash.cover_state,
        publish_date: hash.publish_date,
        archived: hash.archived,
        publisher: hash.publisher,
        label: { title: hash.label.title, color: hash.label.color }
      }
    end

    json = JSON.pretty_generate(book_to_hash)
    File.write('./database/book.json', json)
  end




end
