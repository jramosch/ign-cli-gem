#CLI Controller
require 'pry'
class IGN::CLI

  def call
    make_games
    welcome
    menu
  end

  def welcome
    puts "                             ,--. "
    puts "   ,---,  ,----..          ,--.'| "
    puts ",`--.' | /   /   \\     ,--,:  : | "
    puts "|   :  :|   :     : ,`--.'`|  ' : "
    puts ":   |  '.   |  ;. / |   :  :  | | "
    puts "|   :  |.   ; /--`  :   |   \\ | : "
    puts "'   '  ;;   | ;  __ |   : '  '; | "
    puts "|   |  ||   : |.' .''   ' ;.    ; "
    puts "'   :  ;.   | '_.' :|   | | \\   | "
    puts "|   |  ''   ; : \\  |'   : |  ; .' "
    puts "'   :  |'   | '/  .'|   | '`--'   "
    puts ";   |.' |   :    /  '   : |       "
    puts "'---'    \\   \\ .'   ;   |.'       "
    puts "          `---`     '---'         "
    puts "----------------------------------"
    puts "   Video game news and reviews!   "
    puts "   To leave program type 'exit'   "
    puts "++++++++++++++++++++++++++++++++++"
    #binding.pry
  end

  def make_games
    IGN::Game.scrape_front_page
    IGN::Game.scrape_editors_choice
  end

  def menu
    games_options
    puts "Please enter 1-6 or type exit to leave."
    input = gets.strip.downcase
    case input
    when "1"
      IGN::Game.list_editors_choice
    when "2"
      puts "New Releases Here"
    when "3"
      IGN::Game.top_games
    when "exit"
      goodbye
    else
      puts "Sorry. Please try again."
      menu
    end
  end

  def games_options
    puts "Choose from the below (1-6)"
    puts "1. Editor's Choice"
    puts "2. New Releases"
    puts "3. Top 10 Games"
    puts "4. Coming Soon"
    puts "5. Browse by platform"
    puts "6. Browse by genre"
    puts "7. List All"
  end

end
