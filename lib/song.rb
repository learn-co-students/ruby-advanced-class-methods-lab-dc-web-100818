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
    @@all << song
    song
  end
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end
  def self.find_by_name(name)
    @@all.find do |person|
      person.name == name
   end
  end
  def self.find_or_create_by_name(person)
    self.find_by_name(person) || self.create_by_name(person)
  end
  def self.alphabetical
     @@all.sort_by do |song|
       song.name
    end
  end
  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].split(".mp3")[0]
    song.artist_name = filename.split(" - ")[0]
    song
  end
  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].split(".mp3")[0]
    song.artist_name = filename.split(" - ")[0]
    @@all << song
    song
  end
  def self.destroy_all
    @@all.clear
  end
end
