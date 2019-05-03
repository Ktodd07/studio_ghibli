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
    elsif menu_item == 'spieces'
      create_spieces(response)
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
      gender = hash["gemder"]
      age = hash["age"]
      eye_color = hash["eye_color"]
      hair_color = hash["hair_color"]
      films = hash["films"]
      species = hash["species"]

      StudioGhibli::Person.new(id, name, gender, age, eye_color, hair_color, films, species)
    end
  end

  def create_locations(response)

  end

  def create_species(response)

  end

  def create_vehicles(response)

  end

end
