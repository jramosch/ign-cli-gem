#CLI Controller
require 'pry'
class IGN::CLI

  def call
    menu
    input = nil
    binding.pry
    while input != "exit"
      puts "Movies or Games?"
      input = gets.downcase.chomp
      if input == "movies"
        puts "movie_options"
      elsif input == "games"
        puts "games_options"
      else
        puts "Sorry, don't recognize your command."
        input = gets.downcase.chomp
      end
    end
  end

  def menu
    puts "Welcome to Metacritic!"
    puts "---------------------"
    puts "This program will help you find movies or video games with good reviews!"
    puts "NOTE: To leave program type 'exit'."
    puts "+++++++++++++++++++++++++++++++++"
  end

  def movie_options

  end

end
