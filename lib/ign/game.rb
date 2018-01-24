class IGN::Game
  attr_accessor :name, :platform, :genre, :rating, :release_date, :url

  @@all = []
  @@front_page = []
  @@editors_choice =[]

  def initialize(game_hash)
    game_hash.each {|key,value| self.send(("#{key}="),value)}
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
      if @@all.all? { |g| g.name != game.name }
        @@all << game
      end
    end
    @@front_page
  end

  def self.editors_choice
    games_array = Scraper.scrape("http://www.ign.com/editors-choice/games")

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @@editors_choice << game
      if @@all.all? { |g| g.name != game.name }
        @@all << game
      end
    end
    @@editors_choice
  end
end
