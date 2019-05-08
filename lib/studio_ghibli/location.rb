class StudioGhibli::Location
  @@all = []
  attr_reader :id, :name, :climate, :terrain, :surface_water, :residents, :films, :url

  def initialize(id, name, climate, terrain, surface_water, residents, films, url)
    @id = id
    @name = name
    @climate = climate
    @terrain = terrain
    @surface_water = surface_water
    @residents = residents
    @films = films
    @url = url

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)

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
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

end
