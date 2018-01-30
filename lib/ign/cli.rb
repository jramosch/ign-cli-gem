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
    IGN::Game.make_front_page
    IGN::Game.make_editors_choice
  end

  def menu
    games_options
    puts "Please enter 1-6 or type exit to leave."
    input = gets.strip.downcase
    case input
    when "1"
      IGN::Game.list_editors_choice
      games_menu(IGN::Game.editors_choice)
    when "2"
      IGN::Game.list_front_page
      games_menu(IGN::Game.front_page)
    when "3"
      IGN::Game.make_coming_soon
      games_menu(IGN::Game.coming_soon)
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
    puts "2. New Releases"
    puts "3. Coming Soon"
    puts "4. Browse by platform"
    puts "5. Browse by genre"
    puts "6. List All"
  end

  def games_menu(games)
    puts "Which do you want more info on?"
    input = gets.strip.to_i

    puts "CLICK HERE: #{games[input-1].url}"
  end

  def goodbye
    puts "Bye Bye!"
  end

end
