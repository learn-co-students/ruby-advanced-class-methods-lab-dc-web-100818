require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  #################### CLASS METHODS
  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    #binding.prys
    song = self.create
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    song
  end

  def self.find_by_name(title)
    self.all.find { |song| song.name === title }
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    return song ? song : self.create_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(filename)
    split_filename = filename.slice(/^[^\.]*/).split(" - ")
    song = self.find_or_create_by_name(split_filename[1])
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song
  end

  def self.destroy_all
    self.all.clear
  end

  ################## INSTANCE METHODS

  def save
    #binding.pry
    self.class.all << self
  end



end
