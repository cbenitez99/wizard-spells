class WIZARD::API

    def initialize
        @url = "https://donmallory.tech/rkSpells.json"
    end

    def get_spell_data
        puts "____----✨✨WOOOOOSH✨✨🧹----____"
        spell_array = HTTParty.get(@url)
        self.create_spell_objects(spell_array)
    end

    def create_spell_objects(spell_array)
        spell_array.each do |spell_hash|
            WIZARD::Spells.new(spell_hash)
        end
    end
end