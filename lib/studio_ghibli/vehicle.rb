class StudioGhibli::Vehicle
  @@all = []
  attr_reader :id, :name, :description, :vehicle_class, :length, :pilot, :films, :url

  def initialize(id, name, description, vehicle_class, length, pilot, films, url)
    @id = id
    @name = name
    @description = description
    @vehicle_class = vehicle_class
    @length = length
    @pilot = pilot
    @films = films
    @url = url

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by(menu_number)
    #could find by id
    index = menu_number - 1
    self.all[index]
  end

end
