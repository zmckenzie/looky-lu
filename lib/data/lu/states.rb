module LookyLu
  class States

    def self.from_country(country_name)

      yml = YAML.load_file(File.dirname(__FILE__) + "/states.yml")

      if country_name == 'all'
        states = []

        yml.each do |k,v|
          states += v
        end

      else
        states = yml[country_name]
      end

      states
    end

  end
end