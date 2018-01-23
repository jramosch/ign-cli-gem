#this will collect game details into hashes to create game objects from

class IGN::Scraper

  def self.scrape(ign_url)
    scraped_games = []
    doc = Nokogiri::HTML(open(ign_url))

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


end
