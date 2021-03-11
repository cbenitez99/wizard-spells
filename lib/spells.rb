class Spells

    @@all = []

    def initialize(spell_hash)

        spell_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end

        @@all << self
    end

    def get_spell_name
        self.spell
    end

    def self.all
        @@all
    end

end
#write a method that will take user input and find and return all the spells that have the user input in their title. typing "A" returns all spells starting with A; return array
