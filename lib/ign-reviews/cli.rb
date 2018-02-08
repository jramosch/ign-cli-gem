#CLI Controller
class IGNReviews::CLI

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
    IGNReviews::Game.make_front_page
    IGNReviews::Game.make_editors_choice
  end

  def menu
    games_options
    puts " "
    input = gets.strip.downcase
    case input
    when "1"
      IGNReviews::Game.list_editors_choice
      games_menu(IGNReviews::Game.editors_choice)
    when "2"
      IGNReviews::Game.list_front_page
      games_menu(IGNReviews::Game.front_page)
    when "3"
      IGNReviews::Game.make_coming_soon
      games_menu(IGNReviews::Game.coming_soon)
    when "4"
      IGNReviews::Game.list_platforms
      attributes_menu(IGNReviews::Game.platforms, "platform")
    when "5"
      IGNReviews::Game.list_genres
      attributes_menu(IGNReviews::Game.genres, "genre")
    when "6"
      IGNReviews::Game.list_all
      games_menu(IGNReviews::Game.list_all)
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
    puts "Read more here: #{games[i].url.colorize(:blue)}"
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
      games = IGNReviews::Game.all.select { |game| game.platform == "#{number}"}
      IGNReviews::Game.make_list(games)
      puts " "
      games_menu(games)
    else
      games = IGNReviews::Game.all.select { |game| game.genre == "#{number}"}
      IGNReviews::Game.make_list(games)
      puts " "
      games_menu(games)
    end
  end

  def goodbye
    puts " "
    puts "Bye Bye!"
  end

end
