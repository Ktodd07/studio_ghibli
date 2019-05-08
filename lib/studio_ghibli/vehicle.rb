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

  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)

      response.each do |hash|
        id = hash["id"]
        name = hash["name"]
        description = hash["description"]
        vehicle_class = hash["vehicle_class"]
        length = hash["length"]
        pilot = hash["pilot"]
        films = hash["films"]
        url = hash["url"]

        StudioGhibli::Vehicle.new(id, name, description, vehicle_class, length, pilot, films, url)
      end
    end
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

end
