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
    IGN::Game.front_page
    IGN::Game.editors_choice
  end

  def menu
    binding.pry
    games_options
    puts "Please enter 1-6 or type exit to leave."
    input = gets.strip.downcase
    case input
    when "1"
      IGN::Game.list_editors_choice
      games_menu(IGN::Game.editors_choice)
    when "2"
      IGN::Game.top_games
    when "3"
      IGN::Game.coming_soon
    when "4"
      puts "Lists platforms. Then displays all games that match platforms."
    when "5"
      puts "Lists genres. Then displays all games that match genres."
    when "6"
      IGN::Game.list_all
      games_menu(IGN::Game.list_all)
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
    puts "2. Top 10 Games"
    puts "3. Coming Soon"
    puts "4. Browse by platform"
    puts "5. Browse by genre"
    puts "6. List All"
    #puts "7. Search"
  end

  def games_menu(games)
    puts "Which review would you like to see?"
    input = gets.strip.to_i

    puts "CLICK HERE:"
    games[input-1][:url]
  end

end
