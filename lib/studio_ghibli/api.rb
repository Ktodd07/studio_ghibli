class StudioGhibli::Api

  def fetch(menu_item)
    url = "https://ghibliapi.herokuapp.com/#{menu_item}"
    response = HTTParty.get(url)

    if menu_item == 'films'
      create_films(response)
    elsif menu_item == 'people'
      create_people(response)
    elsif menu_item == 'locations'
      create_locations(response)
    elsif menu_item == 'species'
      create_species(response)
    elsif menu_item == 'vehicles'
      create_vehicles(response)
    end
  end

  def create_films(response)
    response.each do |hash|
      id = hash["id"]
      title = hash["title"]
      description = hash["description"]
      director = hash["director"]
      producer = hash["producer"]
      release_date = hash["release_date"]
      rt_score = hash["rt_score"]

      StudioGhibli::Film.new(id, title, description, director, producer, release_date, rt_score)
    end
  end

  def create_people(response)
    response.each do |hash|
      id = hash["id"]
      name = hash["name"]
      gender = hash["gender"]
      age = hash["age"]
      eye_color = hash["eye_color"]
      hair_color = hash["hair_color"]
      films = hash["films"]
      species = hash["species"]

      StudioGhibli::Person.new(id, name, gender, age, eye_color, hair_color, films, species)
    end
  end

  def create_locations(response)
    response.each do |hash|
      id = hash["id"]
      name = hash["name"]
      climate = hash["climate"]
      terrain = hash["terrain"]
      surface_water = hash["surface_water"]
      residents = hash["residents"]
      films = hash["films"]
      url = hash["url"]

      StudioGhibli::Location.new(id, name, climate, terrain, surface_water, residents, films, url)
    end
  end

  def create_species(response)
    response.each do |hash|
      id = hash["id"]
      name = hash["name"]
      classification = hash["classification"]
      eye_colors = hash["eye_colors"]
      hair_colors = hash["hair_colors"]
      url = hash["url"]
      people = hash["people"]
      films = hash["films"]

      StudioGhibli::Species.new(id, name, classification, eye_colors, hair_colors, url, people, films)
    end
  end

  def create_vehicles(response)

  end

end
