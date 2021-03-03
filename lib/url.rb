# Where I define my URL class with my get_url and parse methods.
require 'open-uri'
require 'net/http'
require 'json'

class Url

    URL = "https://donmallory.tech/rkSpells.json"

    def get_url
        
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def all_spells
        spells = JSON.parse(self.get_url)
        spells.collect do |url|
            url["Charm"]
        end
    end
end

spells = Url.new
puts spells.all_spells.uniq