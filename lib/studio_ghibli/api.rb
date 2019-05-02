class StudioGhibli::Api

  def fetch(menu_item)
    url = "https://ghibliapi.herokuapp.com/#{menu_item}"
    response = HTTParty.get(url)
    create_films(response)
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

  def fetch_people
    url = "https://ghibliapi.herokuapp.com/people"
    response = HTTParty.get(url)
    create_films(response)
  end
end
