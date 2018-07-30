module ausbitsAPI
  class Config

    def self.get_ausbitsrc(path)
      if File.exist? path
        lines = File.readlines path
        [ lines[0].strip, lines[1].strip ]
      end
    end

  end
end
