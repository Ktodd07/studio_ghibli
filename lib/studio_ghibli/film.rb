class StudioGhibli::Film
  @@all = []
  attr_reader :id, :title, :description, :director, :producer, :release_date, :rt_score

  def initialize(id, title, description, director, producer, release_date, rt_score)
    @id = id,
    @title = title,
    @description = description,
    @director = director,
    @producer = producer,
    @release_date = release_date,
    @rt_score = rt_score

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
