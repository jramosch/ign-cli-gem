class IGN::Game
  attr_accessor :name, :genre, :rating, :platform

  def self.scrape_home

    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))

    game = self.new
    game.name =

    binding.pry

  end

  def self.scrape_editors_choice
    doc = Nokogiri::HTML(open("http://www.ign.com/editors-choice/games"))


  end

end
