class IGN::Game
  attr_accessor :name, :genre, :rating, :platform

  #@@all = []

  def initialize(game_hash)
    game_hash.each {|key,value| self.send(("#{key}="),value)}
    #@@all << self
  end

  def self.create_from_collection(games_array)
    games_array.each do |game_hash|
      game = self.new(game_hash)
    end
  end

  def self.front_page
    games_array = Scraper.scrape("http://www.ign.com/reviews/games")

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @@front_page << game
    end
  end

  def self.editors_choice
    games_array = Scraper.scrape("http://www.ign.com/editors-choice/games")

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @@front_page << game
    end
  end
end
