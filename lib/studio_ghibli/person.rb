class StudioGhibli::Person
  extend Findable

  @@all = []
  attr_reader :id, :name, :gender, :age, :eye_color, :hair_color, :films, :species

  def initialize(attributes)
    attributes.each {|k, v| instance_variable_set("@#{k}", v) unless v.nil?}

    @@all << self
  end

  def self.all
    @@all
  end

end
