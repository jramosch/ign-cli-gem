class IGN::Game
  attr_accessor :name, :platform, :genre, :rating, :release_date, :url, :description, :genres, :platforms

  @@all = []
  @@front_page = []
  @@editors_choice =[]
  @@coming_soon = []

  def initialize(game_hash)
    game_hash.each {|key,value| self.send(("#{key}="),value)}
  end

  def self.create_from_collection(games_array)
    games_array.each do |game_hash|
      game = self.new(game_hash)
    end
  end

  def self.make_front_page
    games_array = IGN::Scraper.scrape_front_page

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @@front_page << game
      if @@all.all? { |g| g.name != game.name }
        @@all << game
      end
    end
  end

  def self.make_editors_choice
    games_array = IGN::Scraper.scrape_editors_choice

    games_array.each do |game_hash|
      game = self.new(game_hash)
      @@editors_choice << game
      if @@all.all? { |g| g.name != game.name }
        @@all << game
      end
    end
  end

  def self.make_coming_soon
    games = IGN::Scraper.scrape_coming_soon

    games.take(9).each.with_index(1) do |game_hash, i|
      game = self.new(game_hash)
      @@coming_soon << game
      puts "#{i}. #{game.name} (#{game.platform}) - #{game.release_date}"
    end
  end

  def self.make_list(games)
    games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name} - #{game.rating}/10 - #{game.platform}"
    end
  end

  def self.list_genres
    @genres = (@@all.collect {|game| game.genre}).uniq
    @genres.each.with_index(1) do |genre,i|
      puts "#{i}. #{genre}"
    end
  end

  def self.genres
    @genres
  end

  def self.platforms
    @platforms
  end

  def self.list_platforms
    @platforms = (@@all.collect {|game| game.platform}).uniq
    @platforms.each.with_index(1) do |platform,i|
      puts "#{i}. #{platform}"
    end
  end

  def self.list_editors_choice
    make_list(@@editors_choice)
  end

  def self.list_front_page
    make_list(@@front_page)
  end

  def self.list_all
    make_list(@@all)
  end

  def self.all
    @@all
  end

  def self.front_page
    @@front_page
  end

  def self.editors_choice
    @@editors_choice
  end

  def self.coming_soon
    @@coming_soon
  end
end
