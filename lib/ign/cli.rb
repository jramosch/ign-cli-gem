#CLI Controller
require 'pry'
class IGN::CLI

  def call
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
  end

  def menu
    input = nil
    while input != "exit"
      puts games_options
      input = gets.strip.downcase
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

  def games_options
    puts "1. "
  end

end
