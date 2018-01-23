class IGN::Game
  attr_accessor :name, :genre, :rating, :platform

  @@all = []

  def initialize(game_hash)
    student_hash.each {|key,value| self.send(("#{key}="),value)}
    @@all << self
  end


end
