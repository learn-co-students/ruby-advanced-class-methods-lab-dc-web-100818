require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create # creates an object, at this point has no defining features in this example
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    foundSong = self.find_by_name(name)
    if foundSong
      foundSong
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name}
    sorted
  end

  def self.new_from_filename
  end
end
