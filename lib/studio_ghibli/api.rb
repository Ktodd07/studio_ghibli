class StudioGhibli::Api

  def fetch(menu_item)
    url = "https://ghibliapi.herokuapp.com/#{menu_item}"
    response = HTTParty.get(url)
    response
  end

end
