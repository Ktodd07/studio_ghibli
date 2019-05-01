#CLI controller
require 'pry'

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

class StudioGhibli::CLI

  def call
    sweet_ascii_greeting
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

  def print_main_menu
    puts " "
    puts "                  MAIN MENU".blue
    puts " "
    puts "About".yellow + " - About Studio Ghibli"
    puts "Films".yellow + " - Studio Ghibli Film Collection"
    puts "Exit".yellow
    puts " "
  end

  def valid_input
    user_input = gets.strip.downcase
    until user_input == "about" || user_input == "films" || user_input == "exit"
      puts " "
      puts "Invalid Entry".red
      puts " "
      puts "Please select from the menu items in yellow"
      puts " "
      user_input = gets.strip.downcase
    end
    user_input
  end

  def main_menu
    print_main_menu
    user_input = valid_input
    if user_input == "about"
      puts " "
      puts "             ABOUT STUDIO GHIBLI".blue
      puts " "
    elsif user_input == "films"
      puts " "
      puts "        STUDIO GHIBLI FILM COLLECTION".blue
      puts " "
    elsif user_input == "exit"
      sweet_ascii_farwell
    end
  end
end
