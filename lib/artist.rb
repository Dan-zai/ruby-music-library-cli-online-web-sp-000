class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialise(name) 
    @name = name
    @songs = []
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    all.clear
  end 
  
  def save
    self.class.all << self
  end 
  
  def self.create(name)
    artist = new
    artist.save
    artist
  end 
  
  
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless song.include?(song)
  end
  
  def genres
    @songs.collect {|a| a.genre}.uniq
  end


end 
  
  