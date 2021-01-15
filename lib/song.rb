require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
       if song.name == name
        song
       end
    end
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      @@all[0]
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(str)
    song = self.new
    no_dot = str.split('.')
    name_and_artist = no_dot[0].split(' - ')
    song.name = name_and_artist[1]
    song.artist_name = name_and_artist[0]
    song
  end

  def self.create_from_filename(str)
    song = self.new
    no_dot = str.split('.')
    name_and_artist = no_dot[0].split(' - ')
    song.name = name_and_artist[1]
    song.artist_name = name_and_artist[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
