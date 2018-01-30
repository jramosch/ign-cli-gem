#this will collect game details into hashes to create game objects from

class IGN::Scraper

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

      scraped_games << scraped_game
    end

    scraped_games
  end


end
