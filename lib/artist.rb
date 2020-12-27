require 'pry'

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end
 
  def self.all
    @@all
  end

  def add_song(song)   # tell a passed in `Song` instance it belongs to _this_ `Artist` instance
    song.artist = self
  end

  def songs
    Song.all.select do |song| 
      song.artist == self
    end
  end

  def self.find_or_create_by_name(artist_name)  # This class method should take a passed in name (is a string**) and should either find the artist instance that has that name or create one if it doesn't exist. 
    new_artist = self.all.find{|artist| artist.name == artist_name}
    if new_artist
      new_artist
    else
      new_artist = self.new(artist_name)
    end
    new_artist
  end

  def print_songs
    printed_songs = songs
    printed_songs.each do |song|
      puts song.name
    end
  end
end