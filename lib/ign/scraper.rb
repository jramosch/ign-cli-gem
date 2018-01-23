#this will collect game details into hashes to create game objects from

class IGN::Scraper

  @@scraped_games = []

  def self.scrape(ign_url)
    html = ign_url
    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))

    games = doc.css("div.itemList-item")
    games.each do |game|
      scraped_game = {}
      scraped_game[:name] = game.css("div.item-title a").text.strip
      scraped_game[:platform] = game.css("span.item-platform").text
      scraped_game[:genre] = game.css("span.item-genre").text.strip
      scraped_game[:rating] = game.css("span.scoreBox-score").text
    end

    game = self.new
    game.name =

    binding.pry

  end

  def self.scrape_editors_choice
    doc = Nokogiri::HTML(open("http://www.ign.com/editors-choice/games"))


  end

end
