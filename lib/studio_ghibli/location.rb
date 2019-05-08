class StudioGhibli::Location
  extend Findable

  @@all = []
  attr_reader :id, :name, :climate, :terrain, :surface_water, :residents, :films, :url

  def initialize(attributes)
    attributes.each {|k, v| instance_variable_set("@#{k}", v) unless v.nil?}

    @@all << self
  end

  def self.all
    @@all
  end

end
