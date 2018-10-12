require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name 
    @artist_name = artist_name
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end
  
  def self.create
    song = self.new
    song.save
  end 
  
  def self.new_by_name(song_title)
    Song.new(song_title)
  end 
  
  def self.create_by_name(song_title)
    song = self.new_by_name(song_title)
    song.save
  end 
  
  def self.find_by_name(song_title)
    self.all.find {|song| song.name == song_title}
  end 
  
  def self.find_or_create_by_name(song_title)
    self.create_by_name(song_title)
    self.find_by_name(song_title)
  end 
  
  def self.alphabetical
    self.all.sort_by{|object| object.name}
  end 

  def self.new_from_filename(file)
    song = Song.new
    file = file.split(" - ")
    song.artist_name = file[0]
    song.name = file[-1].chomp(".mp3")
    song
  end 
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end 
  
  def self.destroy_all 
    self.all.clear
  end 

end
