#CLI controller
class String

    def red; colorize(self, "\e[1m\e[31m"); end
    def green; colorize(self, "\e[1m\e[32m"); end
    def dark_green; colorize(self, "\e[32m"); end
    def yellow; colorize(self, "\e[1m\e[33m"); end
    def blue; colorize(self, "\e[1m\e[34m"); end
    def dark_blue; colorize(self, "\e[34m"); end
    def pur; colorize(self, "\e[1m\e[35m"); end
    def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end

class StudioGhibli::Cli

  def call
    sweet_ascii_greeting
    StudioGhibli::Api.new.fetch_films
    main_menu
  end

  def sweet_ascii_greeting
    puts " "
    puts "           WELCOME TO STUDIO GHIBLI!".red
    puts " "
    puts <<-DOC.gsub(/^\s+/, "")
    dNNNNNNNNNNNNNNNNNb  oo  ooo o  o ooo.  o .ooo.
    NNNNNN'`NNN'`NNNNNN 8  "  8  8  8 8  `b 8 8   8
    NNNNNF  YNP  YNNNNN "oo.  8  8  8 8   8 8 8   8
    NNNNN'  `V'  `NNNNN    8  8  8  8 8   8 8 8   8
    NNNNF _     _ YNNNN o  8  8  8  8 8  ,P 8 8   8
    NNNN (.)   (.) NNNN  ""   "   ""  """'  "  """
    NNNF  "     "  YNNN   ooo.  o   o o ooo   o   o
    NNN'           `NNN .P   "  8   8 8 8  8  8   8
    NNN             NNN 8       8ooo8 8 8oob  8   8
    NNN             NNM 8   ""8 8   8 8 8  `b 8   8
    N""e           s""M "b   d" 8   8 8 8  .8 8   8
    YCGMMNNNNNNNNNMMGCP   """   "   " " """"  """ "

    DOC
    puts " "
  end

  def sweet_ascii_farwell
    puts " "
    puts <<-DOC.red
     _____
    /     \\              SAYONARA!
    vvvvvvv  /|__/|
       I   /O,O   |
       I /_____   |      /|/|
       J/^ ^ ^ \\  |    /00  |    _//|
       |^ ^ ^ ^ |W|   |/^^\\ |  /oo  |
        \\m___m__|_|    \\m_m_|  \\mm_ |

    DOC
    puts " "
  end

  def main_menu
    puts " "
    puts "        STUDIO GHIBLI FILM COLLECTION".blue
    puts " "
    puts "Which film number would you like to know more about?"
    puts " "
    StudioGhibli::Film.all.each.with_index(1) {|film, i| puts "#{i}.".blue + " #{film.title}".dark_green }
    puts " "
    user_input = StudioGhibli::Film.find_by(valid_input)
    sub_menu(user_input)
  end

  def sub_menu(film)
    puts " "
    puts "#{film.title}".upcase.red + " - ".blue + "#{film.release_date}"
    puts " "
    puts "#{film.description}".dark_green
    puts " "
    puts "Directed by: ".blue + "#{film.director}"
    puts " "
    puts "Produced by: ".blue + "#{film.producer}"
    puts " "
    puts "Rotten Tomatoes Score: ".blue + "#{film.rt_score}% ".red

    back_or_exit
  end

  def back_or_exit
    puts " "
    puts " "
    puts "Back".yellow + " for more films or " + "Exit".yellow
    puts " "
    user_input = gets.strip.downcase


    unless user_input == "back" || user_input == "exit"
      puts "Invalid Entry".red
      back_or_exit
    end
    if user_input == "back"
      main_menu
    elsif user_input == "exit"
      sweet_ascii_farwell
    end
  end

  def valid_input
    user_input = gets.strip.downcase.to_i
    until user_input > 0
      puts " "
      puts "Invalid Entry".red
      puts " "
      puts "Please select a number from the menu"
      puts " "
      user_input = gets.strip.downcase.to_i
    end
    user_input
  end

end
