class Spells < Url
    attr_accessor :spell, :effect, :type
    @@all = []


    def initialize(spell, effect, type)
        @spell = spell
        @effect = effect
        @type = type
        @@all << self
    end

    def self.all
        @@all = self
    end
end