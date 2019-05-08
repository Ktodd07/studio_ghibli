class StudioGhibli::Location
  @@all = []
  attr_accessor :id, :name, :climate, :terrain, :surface_water, :residents, :films, :url

  def initialize(attributes)
    attributes.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)

      response.each do |attributes|
        self.new(attributes)
      end
    end
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

end
