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

  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)

      response.each do |hash|
        id = hash["id"]
        title = hash["title"]
        description = hash["description"]
        director = hash["director"]
        producer = hash["producer"]
        release_date = hash["release_date"]
        rt_score = hash["rt_score"]

        StudioGhibli::Film.new(id, title, description, director, producer, release_date, rt_score)
      end
    end
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

end
