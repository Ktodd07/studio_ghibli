class StudioGhibli::Species
  extend Findable

  @@all = []
  attr_reader :id, :name, :classification, :eye_colors, :hair_colors, :url, :people, :films

  def initialize(attributes)
    attributes.each {|k, v| instance_variable_set("@#{k}", v) unless v.nil?}

    @@all << self
  end

  def self.all
    @@all
  end

end
