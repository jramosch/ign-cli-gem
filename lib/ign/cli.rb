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
    binding.pry
  end

  def make_games
    Game.scrape_front_page
    Game.scrape_editors_choice
  end

  def menu
    input = nil
    while input != "exit"
      games_options
      input = gets.strip.downcase
      if input == "1"
        
      else
        puts "Sorry, please enter 1-6 or type exit to leave."
        games_options
        input = gets.downcase.chomp
      end
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
    #puts "7. Browse by rating"-- not sure about this
  end

end
