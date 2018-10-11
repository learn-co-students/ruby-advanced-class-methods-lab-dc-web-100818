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
  
  def self.create
   song = self.new 
   self.all << song  
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
    self.all << song 
    song 
    
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    if !(self.find_by_name(song_name))
      self.create_by_name(song_name)
    else 
      self.find_by_name(song_name)
    end
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(file)
    song = self.new 
    song_info = file.split(" - ")
    artist = song_info[0]
    song_name = song_info[1].split(".").flatten[0]
    
    song.artist_name = artist 
    song.name = song_name
    song 
  end 
  
  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end 
    
  def self.destroy_all
    self.all.clear
  end 
    
end 
  

