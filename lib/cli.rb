class WIZARD::CLI
    # get inputs and display
    def initialize
        WIZARD::API.new.get_spell_data
    end
    
    def run
        greeting
        if menu != 'exit'
            puts choose_spell
        else 
            end_program
        end
    end
    
    def greeting
        puts "Welcome to Hogwarts, young wizard!"
        sleep(1)
    end

    def end_program
        puts "Come back soon!"
        exit
    end

    def menu
        puts "Here are your spells: "
        sleep(3)
        spell_list
    end

    def choose_spell
        input = gets.chomp
        if input == 'exit'
        end_program
        else input.to_i.between?(1, WIZARD::Spells.all.length)
        end
    end


    def spell_list
        WIZARD::Spells.all.each.with_index(1) do |spell, index|
            puts "#{index}. #{spell.spell}"
        end
        puts "Type 'exit' to leave!"
    end
end