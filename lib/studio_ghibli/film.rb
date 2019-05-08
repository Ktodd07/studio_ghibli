class StudioGhibli::Film
  extends StudioGhibli::FindOrCreate

  @@all = []
  attr_accessor :id, :title, :description, :director, :producer, :release_date, :rt_score, :people, :species, :locations, :vehicles, :url
  # attr_writer

  def initialize(attributes)
    attributes.each do |attribute_name, attribute_value|
      self.send("#{attribute_name}=", attribute_value)
    end

    @@all << self
  end

  def self.all
    @@all
  end

end
