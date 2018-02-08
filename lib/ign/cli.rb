#CLI Controller
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
  end

  def make_games
    IGN::Game.make_front_page
    IGN::Game.make_editors_choice
  end

  def menu
    games_options
    puts " "
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
      IGN::Game.list_platforms
      attributes_menu(IGN::Game.platforms, "platform")
    when "5"
      IGN::Game.list_genres
      attributes_menu(IGN::Game.genres, "genre")
    when "6"
      IGN::Game.list_all
      games_menu(IGN::Game.list_all)
    when "exit"
      goodbye
    else
      puts " "
      puts "Sorry. Please try again."
      puts " "
      menu
    end
  end

  def games_options
    puts "Choose from the below (1-6) or type exit to leave."
    puts " "
    puts "1. Editor's Choice"
    puts "2. New Releases"
    puts "3. Coming Soon"
    puts "4. Browse by platform"
    puts "5. Browse by genre"
    puts "6. List All"
  end

  def games_menu(games)
    puts " "
    puts "Which would you like more info on?"
    input = gets.strip.to_i
    i = input - 1
    puts " "
    puts "#{games[i].name} - #{games[i].platform}"
    puts "Rating: #{games[i].rating}/10"
    puts "Genre: #{games[i].genre}"
    puts "----------------------------------"
    puts "#{games[i].description}"
    puts " "
    puts "Read more here: #{games[i].url}"
    puts " "
    puts "Is that all? (Y/N)"
    input = gets.strip.downcase
    if input == "n"
      menu
    else
      goodbye
    end

  end

  def attributes_menu(games, choice)
    puts " "
    puts "Which #{choice} would you like to see?"
    input = gets.strip.to_i
    puts " "
    number = games[input-1]

    if choice == "platform"
      games = IGN::Game.all.select { |game| game.platform == "#{number}"}
      IGN::Game.make_list(games)
      puts " "
      games_menu(games)
    else
      games = IGN::Game.all.select { |game| game.genre == "#{number}"}
      IGN::Game.make_list(games)
      puts " "
      games_menu(games)
    end
  end

  def goodbye
    puts " "
    puts "Bye Bye!"
  end

end
