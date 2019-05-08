class StudioGhibli::Location
  @@all = []
  attr_reader :id, :name, :climate, :terrain, :surface_water, :residents, :films, :url

  def initialize(attributes)
    attributes.each {|k, v| instance_variable_set("@#{k}", v) unless v.nil?}

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)
      response.each { |hash| self.new(hash) }
    end
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

end
