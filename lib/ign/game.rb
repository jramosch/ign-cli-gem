class IGN::Game
  attr_accessor :name, :genre, :rating, :platform

  @@all = []

  def initialize(game_hash)
    student_hash.each {|key,value| self.send(("#{key}="),value)}
    @@all << self
  end

  def self.scrape(ign_url)
    scraped_games = []
    html = ign_url
    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))

    games = doc.css("div.itemList-item")

    games.each do |game|
      scraped_game = {}
      scraped_game[:name] = game.css("div.item-title a").text.strip
      scraped_game[:platform] = game.css("span.item-platform").text
      scraped_game[:genre] = game.css("span.item-genre").text.strip
      scraped_game[:rating] = game.css("span.scoreBox-score").text

      scraped_games << scraped_game
    end

    scraped_games
  end

  def self.scrape_editors_choice
    doc = Nokogiri::HTML(open("http://www.ign.com/editors-choice/games"))
  end


end
