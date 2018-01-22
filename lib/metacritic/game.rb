class Metacritic::Game
  attr_accessor :name, :genre, :rating, :platform

  def self.scrape
    doc = Nokogiri::HTML(open("http://www.ign.com/reviews/games"))



    binding.pry

  end

end
