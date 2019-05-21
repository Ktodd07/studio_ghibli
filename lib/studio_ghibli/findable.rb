module Findable

  def find_or_create(menu_item)
    if all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)
      response.each { |hash| self.new(hash) }
    end
  end

  def find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

  def find_by_id(id)
    self.all.detect {|film| film.id == self.strip_url(id)}
  end

  def strip_url(url)
    url.gsub(/^[a-z]*\S{3}[a-z]*\S[a-z]*\S[a-z]*\S[a-z]*\S/, "")
  end

end
