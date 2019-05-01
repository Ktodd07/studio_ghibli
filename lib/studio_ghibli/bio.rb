class StudioGhibli::Bio
  @@all
  attr_accessor :description, :name, :history, :animators, :external_links

  def initialize(description, name, history, animators, external_links)
    @description = description
    @name = name
    @history = history
    @animators = animators
    @external_links = external_links
    self.save
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

  # def find_or_create
  #
  # end

  def self.scrape
    #got to wikipedia
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Studio_Ghibli"))
    binding.pry
    #scrape the info for the sections
    # description = doc.
    # name = doc.
    # history =
    # animators =
    # external_links =

    #instanciate a bio object
    Bio.new(description, name, history, animators, external_links)
  end
end
