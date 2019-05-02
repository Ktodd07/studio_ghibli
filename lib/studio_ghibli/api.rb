class StudioGhibli::Api

  def fetch_films
    url = "https://ghibliapi.herokuapp.com/films"
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
end
