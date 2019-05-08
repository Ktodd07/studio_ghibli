module StudioGhibli::FindOrCreate
  def self.find_or_create(menu_item)
    if self.all.empty?
      response = StudioGhibli::Api.new.fetch(menu_item)

      response.each do |attributes|
        self.new(attributes)class StudioGhibli::FindAndCreate
          def self.find_or_create(menu_item)
            if self.all.empty?
              response = StudioGhibli::Api.new.fetch(menu_item)

              response.each do |attributes|
                self.new(attributes)
              end
            end
          end

          def self.find_by(menu_number)
            index = menu_number - 1
            self.all[index]
          end

          def self.find_by_id(id)
            self.all.detect do |film|
              film.id == self.strip_url(id)
            end
          end

          def self.strip_url(url)
            url.gsub(/^[a-z]*\S{3}[a-z]*\S[a-z]*\S[a-z]*\S[a-z]*\S/, "")
          end

        end

      end
    end
  end

  def self.find_by(menu_number)
    index = menu_number - 1
    self.all[index]
  end

  def self.find_by_id(id)
    self.all.detect do |film|
      film.id == self.strip_url(id)
    end
  end

  def self.strip_url(url)
    url.gsub(/^[a-z]*\S{3}[a-z]*\S[a-z]*\S[a-z]*\S[a-z]*\S/, "")
  end

end
