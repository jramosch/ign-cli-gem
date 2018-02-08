#this will collect game details into hashes to create game objects from

class IGNReviews::Scraper

  def self.scrape_front_page
    scraped_games = []
    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))

    games = doc.css("div.itemList-item")

    games.each do |game|
      scraped_game = {}
      scraped_game[:name] = game.css("div.item-title a").text.strip
      scraped_game[:platform] = game.css("span.item-platform").text
      scraped_game[:genre] = game.css("span.item-genre").text.strip
      scraped_game[:rating] = game.css("span.scoreBox-score").text
      scraped_game[:release_date] = game.css("div.grid_3 div")[0].text
      scraped_game[:url] = game.css("li a")[0]["href"]
      scraped_game[:description] = game.css("p.item-details").text.split(/\s+- /).delete_if{|space|space == ""}[1]

      scraped_games << scraped_game
    end

    scraped_games
  end

  def self.scrape_editors_choice
    scraped_games = []
    doc = Nokogiri::HTML(open("http://www.ign.com/editors-choice/games"))

    games = doc.css("div.gameList-game")

    games.each do |game|
      scraped_game = {}
      scraped_game[:name] = game.css("div.game-title a").text.strip
      scraped_game[:platform] = game.css("span.game-platform").text
      scraped_game[:genre] = game.css("span.game-genre").text.strip
      scraped_game[:rating] = game.css("span.scoreBox-score").text
      scraped_game[:release_date] = game.css("div.grid_3 div")[0].text
      scraped_game[:url] = game.css("li a")[0]["href"]
      scraped_game[:description] = game.css("p.game-details").text.split(/\s+- /).delete_if{|space|space == ""}[1]

      scraped_games << scraped_game
    end

    scraped_games
  end

  def self.scrape_coming_soon
    scraped_games = []
    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))

    games = doc.css("div.column-game")

    games.each do |game|
      scraped_game = {}
      scraped_game[:name] = game.css("a.game-title").text.strip
      scraped_game[:platform] = game.css("span.game-platform").text
      scraped_game[:release_date] = game.css("div.date").text
      scraped_game[:url] = game.css("a")[0]["href"]
      scraped_game[:description] = scrape_description(game.css("a")[0]["href"])

      scraped_games << scraped_game
    end

    scraped_games
  end

  def self.scrape_description(url)
    doc = Nokogiri::HTML(open("#{url}"))

    description = doc.css("div.description").text.strip
    description
  end

end
