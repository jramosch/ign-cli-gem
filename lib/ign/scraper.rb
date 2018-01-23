#this will collect game details into hashes to create game objects from

class IGN::Scraper

  @@scraped_games = []

  def self.scrape_home

    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))

    games = doc.css("div.clear itemList-item")
    games.each do |game|
      scraped_game = []
      scraped_game[:name] = game.css("")
    end

    game = self.new
    game.name =

    binding.pry

  end

  def self.scrape_editors_choice
    doc = Nokogiri::HTML(open("http://www.ign.com/editors-choice/games"))


  end

end
