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

  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)

      response.each do |hash|
        id = hash["id"]
        name = hash["name"]
        classification = hash["classification"]
        eye_colors = hash["eye_colors"]
        hair_colors = hash["hair_colors"]
        url = hash["url"]
        people = hash["people"]
        films = hash["films"]

        StudioGhibli::Species.new(id, name, classification, eye_colors, hair_colors, url, people, films)
      end
    end
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

  def self.find_by_id(id)
    self.all.detect do |person|
      person.id == self.strip_url(id)
    end
  end

  def self.strip_url(url)
    url.gsub(/^[a-z]*\S{3}[a-z]*\S[a-z]*\S[a-z]*\S[a-z]*\S/, "")
  end
end
