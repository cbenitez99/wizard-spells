#apiendpoint = /rkSpells.json
class WIZARD::API

    def initialize
        @url = "https://donmallory.tech/rkSpells.json"
    end

    def get_spell_data
        spell_hash = HTTParty.get(@url)
        binding.pry
    end

end