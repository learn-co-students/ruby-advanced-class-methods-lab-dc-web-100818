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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_names = filename.split(" - ")
    #turns filenames into arrays, splitting them at the dash
    artist_name = song_names[0]
    #looks for the 0 indexed element for each file name, labels as artist_name
    name = song_names[1].chomp!('.mp3')
    #looks for 1 indexed element for each file (which is the song title)
    #gets rid of the .mp3

    song = self.new
    #song equals a new instance of this Song class
    song.name = name
    #calls name method on that song, with added factors of THIS method
    song.artist_name = artist_name
    #calls artist_name method on that song, with added factors of THIS method

    song
    #returns song
  end

  def self.create_from_filename(filename)
    song_names = filename.split(" - ")
    artist_name = song_names[0]
    name = song_names[1].chomp!('.mp3')

    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song

    song
  end

  def self.destroy_all
    @@all.clear
  end

end
