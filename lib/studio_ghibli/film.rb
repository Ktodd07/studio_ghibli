class StudioGhibli::Film
  attr_reader :id, :title, :description, :director, :producer, :release_date, :rt_score

  def initialize(id, title, description, director, producer, release_date, rt_score)
    @id = id,
    @title = title,
    @description = description,
    @director = director,
    @producer = producer,
    @release_date = release_date,
    @rt_score = rt_score
  end

end
