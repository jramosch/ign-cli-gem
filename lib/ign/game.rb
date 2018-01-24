class IGN::Game
  attr_accessor :name, :platform, :genre, :rating, :release_date, :url

  @@all = []
  #@@front_page = []
  #@@editors_choice =[]

  def initialize(game_hash)
    game_hash.each {|key,value| self.send(("#{key}="),value)}
  end

  def self.create_from_collection(games_array)
    games_array.each do |game_hash|
      game = self.new(game_hash)
    end
  end

  def self.scrape_front_page
    @front_page = []
    games_array = IGN::Scraper.scrape("http://www.ign.com/reviews/games")

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @front_page << game
      if @@all.all? { |g| g.name != game.name }
        @@all << game
      end
    end
  end

  def self.scrape_editors_choice
    @editors_choice = []
    games_array = IGN::Scraper.scrape("http://www.ign.com/editors-choice/games")

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @editors_choice << game
      if @@all.all? { |g| g.name != game.name }
        @@all << game
      end
    end
  end

  def self.list_editors_choice
    make_list(@editors_choice)
  end

  def self.list_front_page
    make_list(@front_page)
  end

  def self.list_all
    make_list(@@all)
  end

  def make_list(games)
    games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name} - #{game.rating}/10 - #{game.platform}"
    end
  end

  def self.top_games
    sorted_games = Games.all.sort_by{ |i| i.rating}.reverse
    sorted_games.each.with_index(1) do |game, i|
      break if i > 10
      puts "#{i}. #{game.name} - #{game.rating}/10 - #{game.platform}"
    end
  end
end
