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

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end
end
