class Description

    @@all = []
    attr_accessor :description
    
    def initialize(description)
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(description)
        found_desc = self.all.find do |describe|
            describe.description == description
        end
        if found_desc
            return found_desc
        else
            return self.new(description)
        end
    end

end