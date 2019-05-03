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
    print_main_menu
    menu_item = gets.strip.downcase
    StudioGhibli::Api.new.fetch(menu_item)
    if menu_item == "films"
      film_menu
    elsif menu_item == 'people'
      people_menu
    elsif menu_item == 'locations'
      location_menu
    elsif menu_item == 'species'
      species_menu
    elsif menu_item == 'vehicles'
      vehicle_menu
    elsif menu_item == 'exit'
      sweet_ascii_farwell
    else
      puts " "
      puts "Invalid entry".red
      main_menu
    end
  end

  def print_main_menu
    puts " "
    puts " "
    puts "Which part of the Studio Ghibli Universe would you like to know more about?".blue
    puts " "
    puts "FLIMS".yellow
    puts " "
    puts "PEOPLE".yellow
    puts " "
    puts "LOCATIONS".yellow
    puts " "
    puts "SPECIES".yellow
    puts " "
    puts "VEHICLES".yellow
    puts " "
    puts " "
    puts "EXIT".red
  end

  def back_main_or_exit(prior_menu)
    puts " "
    puts " "
    puts "Back".yellow + ", " +"Main".yellow + " Menu," + " or " + "Exit".red
    puts " "
    user_input = gets.strip.downcase
    unless user_input == "back" || user_input == "main" || user_input == "exit"
      puts "Invalid Entry".red
      back_main_or_exit(prior_menu)
    end
    if user_input == "back" && prior_menu == "flims"
      film_menu
    elsif user_input == "back" && prior_menu == "people"
      people_menu
    elsif user_input == "back" && prior_menu == "location"
      location_menu
    elsif user_input == "back" && prior_menu == "species"
      species_menu
    elsif user_input == "back" && prior_menu == "vehicle"
      vehicle_menu
    elsif user_input == "main"
      main_menu
    elsif user_input == "exit"
      sweet_ascii_farwell
    end
  end

  def detail(attribute)
    if attribute == nil
      "Unknown"
    elsif attribute == "NA"
      "N/A"
    elsif attribute == "TODO"
      "No Data Available".red
    else
      attribute
    end
  end

  def valid_input
    user_input = gets.strip.downcase
    if user_input == 'exit'
      sweet_ascii_farwell
    else
      until user_input.to_i > 0
        puts " "
        puts "Invalid Entry".red
        puts " "
        puts "Please select a number from the menu"
        puts " "
        valid_input
      end
    end
    user_input.to_i
  end

  def film_menu
    puts " "
    puts "        STUDIO GHIBLI FILM COLLECTION".blue
    puts " "
    puts "Which Film number would you like to know more about?"
    puts " "
    StudioGhibli::Film.all.each.with_index(1) {|film, i| puts "#{i}.".blue + " #{film.title.upcase}".dark_green }
    puts " "
    puts " "
    puts "EXIT".red
    input = valid_input
    if input != nil && input > 0
      film = StudioGhibli::Film.find_by(input)
      film_detail(film)
    end
  end

  def film_detail(film)
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

    back_main_or_exit("films")
  end

  def people_menu
    puts " "
    puts "           CHARACTERS OF THE STUDIO GHIBLI UNIVERSE".blue
    puts " "
    puts "Which Character number would you like to know more about?"
    puts " "
    StudioGhibli::Person.all.each.with_index(1) {|person, i| puts "#{i}.".blue + " #{person.name.upcase}".dark_green }
    puts " "
    puts " "
    puts "EXIT".red
    input = valid_input
    if input != nil && input > 0
      person = StudioGhibli::Person.find_by(input)
      people_detail(person)
    end
  end

  def people_detail(person)
    puts " "
    puts "Character: ".blue + "#{detail(person.name.upcase)}".red
    puts " "
    puts "Gender: ".blue + detail(person.gender)
    puts " "
    puts "Age: ".blue + detail(person.age)
    puts " "
    puts "Hair: ".blue + "#{detail(person.eye_color.capitalize)} eyes, #{detail(person.hair_color.capitalize)} hair"
    puts " "
    puts "Films: ".blue
       person.films.each {|film| puts "   #{film}"}
    puts " "
    puts "Species: ".blue + detail(person.species)
    puts " "
    puts " "
    back_main_or_exit("people")
  end

  def location_menu
    puts " "
    puts "           LOCATIONS IN THE STUDIO GHIBLI UNIVERSE".blue
    puts " "
    puts "Which Location number would you like to know more about?"
    puts " "
    StudioGhibli::Location.all.each.with_index(1) {|location, i| puts "#{i}.".blue + " #{location.name.upcase}".dark_green }
    puts " "
    puts " "
    puts "EXIT".red
    input = valid_input
    if input != nil && input > 0
      location = StudioGhibli::Location.find_by(input)
      location_detail(location)
    end
  end

  def location_detail(location)
    puts " "
    puts "Location:".blue + "#{detail(location.name.upcase)}".red
    puts " "
    puts "Climate: ".blue + detail(location.climate)
    puts " "
    puts "Terrain: ".blue + detail(location.terrain)
    puts " "
    puts "Surface Water: ".blue + "#{detail(location.surface_water)}"
    puts " "
    puts "Residents: ".blue
       location.residents.each {|resident| puts "   #{detail(resident)}"}
    puts "Films: ".blue
       location.films.each {|film| puts "   #{detail(film)}"}
    puts " "
    puts " "
    back_main_or_exit("location")
  end

  def species_menu
    puts " "
    puts "             SPECIES OF THE STUDIO GHIBLI UNIVERSE".blue
    puts " "
    puts "Which Species number would you like to know more about?"
    puts " "
    binding.pry
    StudioGhibli::Species.all.each.with_index(1) {|species, i| puts "#{i}.".blue + " #{species.name.upcase}".dark_green }
    puts " "
    puts " "
    puts "EXIT".red
    input = valid_input
    if input != nil && input > 0
      species = StudioGhibli::Species.find_by(input)
      species_detail(species)
    end
  end

  def species_detail(species)
    puts " "
    puts "Species:".blue + "#{detail(species.name.upcase)}".red
    puts " "
    puts "Classification: ".blue + detail(species.classification)
    puts " "
    puts "Eye Colors: ".blue + detail(species.eye_colors)
    puts " "
    puts "Hair Colors: ".blue + "#{detail(species.hair_colors)}"
    puts " "
    puts "Characters: ".blue
       species.people.each {|person| puts "   #{detail(person)}"}
    puts "Films: ".blue
       species.films.each {|film| puts "   #{detail(film)}"}
    puts " "
    puts " "
    back_main_or_exit("species")
  end


end
