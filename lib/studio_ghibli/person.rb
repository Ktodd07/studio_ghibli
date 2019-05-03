class StudioGhibli::Person
  @@all = []
  attr_reader :id, :name, :gender, :age, :eye_color, :hair_color, :films, :species

  def initialize(id, name, gender, age, eye_color, hair_color, films, species)
    @id = id
    @name = name
    @gender = gender
    @age = age
    @eye_color = eye_color
    @hair_color = hair_color
    @films = films
    @species = species

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
