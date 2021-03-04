class WIZARD::CLI
    # get inputs and display
    def initialize
        WIZARD::API.new.get_spell_data
    end
    
    def run
        system("clear")
        greeting
        while menu != '2'
        end
        end_program
    end
    
    def greeting
        puts "Welcome to Hogwarts, young wizard!"
    end

    def end_program
        puts "Come back soon!"
    end

    def menu
        puts "What would you like to do? (Enter '1' or '2')"
        list_options 
        input = gets.strip.downcase
        choose_option(input)
        return input
    end

    def list_options
        puts <<-DOC.gsub /^\s*/, ''
        1. See my spells
        2. exit
        DOC
    end

    def choose_option(option)
        case option
        when "1"
            puts "Here are you spells!: "
            spell_list
        end
        
    end

    def spell_list
        WIZARD::Spells.all.each.with_index(1) do |spell, index|
            puts "#{index}. #{spell.spell}"
        end
        
    end
end