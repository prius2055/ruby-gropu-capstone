require_relative 'music_album'
require_relative 'genre'
require_relative 'storage'

class MusicMethods
  include Storage

  attr_reader :music_albums, :genres

  def initialize
    @music_albums = fetch_albums || []
    @genres = fetch_genres || []
  end

  # end
  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      @music_albums.each do |album|
        puts "ID: #{album.id}, On Spotify: #{album.on_spotify}, Publish Date: #{album.publish_date}"
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'No genres found.'
    else
      @genres.each { |genre| puts "Genre: #{genre.name}" }
    end
  end

  def add_music_album
    print 'Enter the on_spotify value (true/false): '
    on_spotify = gets.chomp.downcase == 'true'
    print 'Enter the publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    album = MusicAlbum.new(on_spotify, publish_date)
    @music_albums << album

    print 'Enter the genre name: '
    genre_name = gets.chomp
    genre = find_or_create_genre(genre_name)
    genre.add_item(album)
    save_albums(@music_albums) # Call save_albums to save the albums to the JSON file
    save_data("#{DATABASE_FOLDER}/genre.json", array_to_hash(@genres)) # Save genres to the JSON file
    puts 'Music album added successfully.'
    puts 'Music album added successfully.'
  end

  def find_or_create_genre(genre_name)
    genre = @genres.find { |g| g.name == genre_name }
    return genre unless genre.nil?

    new_genre = Genre.new(genre_name)
    @genres << new_genre
    new_genre
  end
end
