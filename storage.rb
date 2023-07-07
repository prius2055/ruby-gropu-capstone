require 'json'
require 'fileutils'
require_relative 'music_album'
require_relative 'genre'

module Storage
  DATABASE_FOLDER = './database'.freeze

  # Method to save albums to a JSON file
  def save_albums(albums)
    save_data("#{DATABASE_FOLDER}/album.json", array_to_hash(albums))
  end

  # Method to fetch albums from a JSON file
  def fetch_albums
    albums = fetch_data("#{DATABASE_FOLDER}/album.json")
    albums_arr = []
    albums&.each do |album|
      album_sample = MusicAlbum.new(album['on_spotify'], album['publish_date'])
      extra_to_array(album_sample, album)
      albums_arr << album_sample
    end
    albums_arr
  end

  # Method to fetch genres from a JSON file
  def fetch_genres
    genres = fetch_data("#{DATABASE_FOLDER}/genre.json")
    genres&.map do |genre|
      Genre.new(genre['name'])
    end
  end

  private

  # Method to save data to a JSON file
  def save_data(file_path, data)
    json = JSON.generate(data)
    File.write(file_path, json)
  end

  # Method to fetch data from a JSON file
  def fetch_data(file_path)
    FileUtils.mkdir_p(File.dirname(file_path))
    File.new(file_path, 'w+') unless File.exist?(file_path)

    return nil if File.empty?(file_path)

    json_data = File.read(file_path)
    JSON.parse(json_data) unless json_data.empty?
  end

  # Convert an array of objects to a hash
  def array_to_hash(arr)
    arr.map(&:to_hash)
  end

  # Associate label, author, and genre objects with a music album
  def extra_to_array(klass, data)
    genre = Genre.new(data['name'])
    klass.send(:genre=, genre)
  end
end
