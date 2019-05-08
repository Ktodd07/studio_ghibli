class StudioGhibli::Film
  extend Findable

  @@all = []
  attr_reader :id, :title, :description, :director, :producer, :release_date, :rt_score

  def initialize(attributes)
    attributes.each {|k, v| instance_variable_set("@#{k}", v) unless v.nil?}

    @@all << self
  end

  def self.all
    @@all
  end

end
