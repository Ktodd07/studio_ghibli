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
    clear_term
    sweet_ascii_greeting
    StudioGhibli::Film.find_or_create('films')
    StudioGhibli::Person.find_or_create('people')
    StudioGhibli::Location.find_or_create('locations')
    StudioGhibli::Species.find_or_create('species')
    StudioGhibli::Vehicle.find_or_create('vehicles')
    main_menu
  end

  def clear_term
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def sweet_ascii_greeting
    puts " "
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
  end

  def sweet_ascii_farwell
    clear_term
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
    sleep(1.5)
    clear_term
  end

  def main_menu
    print_main_menu
    menu_item = gets.strip.downcase

    clear_term
    if menu_item == 'films'
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
    puts "\n           WELCOME TO STUDIO GHIBLI!\n".red
    puts "\nWhat item would you like to know more about?\n".blue
    puts "\nFLIMS".yellow
    puts "\nPEOPLE".yellow
    puts "\nLOCATIONS".yellow
    puts "\nSPECIES".yellow
    puts "\nVEHICLES".yellow
    puts "\nEXIT\n".red
  end

  def back_main_or_exit(prior_menu)
    puts "\n\n\n\nBack".yellow + ", " +"Main".yellow + " Menu," + " or " + "Exit\n".red
    user_input = gets.strip.downcase
    clear_term
    if user_input == "back"
      case prior_menu
      when "films" then film_menu
      when "people" then people_menu
      when "location" then location_menu
      when "species" then species_menu
      when "vehicle" then vehicle_menu
      end
    elsif user_input == "main"
      main_menu
    elsif user_input == "exit"
      sweet_ascii_farwell
    else
      puts "Invalid Entry".red
      back_main_or_exit(prior_menu)
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

  def valid_input(obj_class)
    user_input = gets.strip.downcase
    if user_input == "exit"
      0
    else
      until user_input.to_i > 0 && user_input.to_i <= obj_class.all.length
        puts "\nInvalid Entry\n".red
        puts "Please select a number from the menu\n"
        user_input = gets.strip.downcase
      end
      user_input.to_i
    end
  end

  def film_menu
    obj_class = StudioGhibli::Film
    puts "\n        STUDIO GHIBLI FILM COLLECTION".blue
    puts "\nWhich Film number would you like to know more about?\n"
    obj_class.all.each.with_index(1) {|film, i| puts "#{i}.".blue + " #{film.title.upcase}".dark_green }
    puts "\n\nEXIT\n".red
    input = valid_input(obj_class)
    return sweet_ascii_farwell if input == 0
    film = obj_class.find_by(input)
    clear_term
    film_detail(film)
    back_main_or_exit("films")
  end

  def film_detail(film)
    puts "\n#{film.title}".upcase.red + " - ".blue + "#{film.release_date}"
    puts "\n#{film.description}".dark_green
    puts "\nDirected by: ".blue + "#{film.director}"
    puts "\nProduced by: ".blue + "#{film.producer}"
    puts "\nRotten Tomatoes Score: ".blue + "#{film.rt_score}% ".red
  end

  def people_menu
    obj_class = StudioGhibli::Person
    puts "\n              CHARACTERS OF THE STUDIO GHIBLI".blue
    puts "\nWhich Character number would you like to know more about?\n"
    obj_class.all.each.with_index(1) {|person, i| puts "#{i}.".blue + " #{person.name.upcase}".dark_green }
    puts "\n\nEXIT\n".red
    input = valid_input(obj_class)
    return sweet_ascii_farwell if input == 0
    person = obj_class.find_by(input)
    clear_term
    people_detail(person)
    back_main_or_exit("people")
  end

  def people_detail(person)
    puts "\nCharacter: ".blue + "#{detail(person.name.upcase)}".red
    puts "\nGender: ".blue + detail(person.gender)
    puts "\nAge: ".blue + detail(person.age)
    puts "\nFacial features: ".blue + "#{detail(person.eye_color.capitalize)} eyes, #{detail(person.hair_color.capitalize)} hair"
    puts "\nFilms: ".blue
       person.films.each do |film|
          film_obj = StudioGhibli::Film.find_by_id(film)
          puts "   #{film_obj.title}"
       end
    puts "\nSpecies: ".blue
       species_obj = StudioGhibli::Species.find_by_id(person.species)
       puts "   #{species_obj.name}"
  end

  def location_menu
    obj_class = StudioGhibli::Location
    puts "\n           LOCATIONS IN THE STUDIO GHIBLI FILMS".blue
    puts "\nWhich Location number would you like to know more about?\n"
    obj_class.all.each.with_index(1) {|location, i| puts "#{i}.".blue + " #{location.name.upcase}".dark_green }
    puts "\n\nEXIT\n".red
    input = valid_input(obj_class)
    return sweet_ascii_farwell if input == 0
    location = obj_class.find_by(input)
    clear_term
    location_detail(location)
    back_main_or_exit("location")
  end

  def location_detail(location)
    puts "\nLocation: ".blue + "#{detail(location.name.upcase)}".red
    puts "\nClimate: ".blue + detail(location.climate)
    puts "\nTerrain: ".blue + detail(location.terrain)
    puts "\nSurface Water: ".blue + "#{detail(location.surface_water)}"
    puts "\nResidents: ".blue
       location.residents.each do |resident|
         person_obj = StudioGhibli::Person.find_by_id(resident)
         if person_obj
           puts "   #{person_obj.name}"
         else
           puts "   No Data Available".red
         end
       end
    puts "Films: ".blue
       location.films.each do |film|
          film_obj = StudioGhibli::Film.find_by_id(film)
          puts "   #{detail(film_obj.title)}"
       end

  end

  def species_menu
    obj_class = StudioGhibli::Species
    puts "\n                 SPECIES OF STUDIO GHIBLI".blue
    puts "\nWhich Species number would you like to know more about?\n"
    obj_class.all.each.with_index(1) {|species, i| puts "#{i}.".blue + " #{species.name.upcase}".dark_green }
    puts "\n\nEXIT\n".red
    input = valid_input(obj_class)
    return sweet_ascii_farwell if input == 0
    species = obj_class.find_by(input)
    clear_term
    species_detail(species)
    back_main_or_exit("species")
  end

  def species_detail(species)
    puts "\nSpecies: ".blue + "#{detail(species.name.upcase)}".red
    puts "\nClassification: ".blue + detail(species.classification)
    puts "\nEye Colors: ".blue + detail(species.eye_colors)
    puts "\nHair Colors: ".blue + "#{detail(species.hair_colors)}"
    puts "\nCharacters: ".blue
      species.people.each do |person|
        person_obj = StudioGhibli::Person.find_by_id(person)
        if person_obj
          puts "   #{person_obj.name}"
        else
          puts "   No Data Available".red
        end
      end
    puts "Films: ".blue
      species.films.each do |film|
         film_obj = StudioGhibli::Film.find_by_id(film)
         puts "   #{detail(film_obj.title)}"
      end
  end

  def vehicle_menu
    obj_class = StudioGhibli::Vehicle
    puts "\n                 VEHICLES OF THE STUDIO GHIBLI".blue
    puts "\nWhich Vehicle number would you like to know more about?\n"
    obj_class.all.each.with_index(1) {|vehicle, i| puts "#{i}.".blue + " #{vehicle.name.upcase}".dark_green }
    puts "\n\nEXIT\n".red
    input = valid_input(obj_class)
    return sweet_ascii_farwell if input == 0
    vehicle = obj_class.find_by(input)
    clear_term
    vehicle_detail(vehicle)
    back_main_or_exit("vehicle")
  end

  def vehicle_detail(vehicle)
    puts "\nVehicle: ".blue + " #{detail(vehicle.name.upcase)}".red
    puts "\nDescripton: ".blue + detail(vehicle.description)
    puts "\nVehicle Class: ".blue + detail(vehicle.vehicle_class)
    puts "\nLength: ".blue + "#{detail(vehicle.length)} meters"
    puts "\nPilot: ".blue
      person_obj = StudioGhibli::Person.find_by_id(vehicle.pilot)
      if person_obj
        puts "   #{person_obj.name}"
      else
        puts "   No Data Available".red
      end

    puts "\nFilms: ".blue
      film_obj = StudioGhibli::Film.find_by_id(vehicle.films)
      puts "   #{detail(film_obj.title)}"
  end
end
