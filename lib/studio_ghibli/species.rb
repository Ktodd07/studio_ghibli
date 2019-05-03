class StudioGhibli::Species
  @@all = []
  attr_reader :id, :name, :classification, :eye_colors, :hair_colors, :url, :people, :films

  def initialize(id, name, classification, eye_colors, hair_colors, url, people, films)
    @id = id
    @name = name
    @classification = classification
    @eye_colors = eye_colors
    @hair_colors = hair_colors
    @url = url
    @people = people
    @films = films

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by(menu_number)
    #could find by id
    index = menu_number - 1
    self.all[index]
  end
end
