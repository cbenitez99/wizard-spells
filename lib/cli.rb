class CLI
    def initialize 
        API.new.get_spell_data
    end
    
    def run_menu
        
        if menu != 'exit'
            puts choose_spell
        else 
            end_program
        end
    end

    def greeting
        puts "Welcome to Hogwarts, Wizard!"
        sleep(1)
    end

    def menu
        puts "Here are your spells: "
        sleep(1)
        spell_list
    end

    def spell_list 
        counter = 1
        while counter <= Spell.all.length
            index = counter - 1
            puts "#{counter}. #{Spell.all[index].spell}"
            counter += 1
        end
        puts "Choose a spell number for more info! || Type 'exit' to leave!"
        input = gets.chomp.downcase
        if input == 'exit'
            end_program
        else
            choose_spell(input)
        end
    end

    def choose_spell(input)
        input = input.to_i
        if input.between?(1, Spell.all.length)
            index = input - 1 
            puts "#{Spell.all[index].spell} effect :"
            puts "#{Spell.all[index].effect}\n"
        else
            puts "BAHAHA!!! THAT'S NOT A VALID NUMBER!?? COME BACK WHEN YOU DECIDE TO TAKE THINGS MORE SERIOUSLY."
        end
        reshow_menu
    end

    def reshow_menu
        puts "Would you like to return to the list of spells? ['Y'] or ['N']"
        input = gets.chomp.downcase
        if input == 'n'
            end_program
        elsif input == 'y'
            menu 
        else 
            puts "CHOOSE A VALID OPTION YOU BUFFOON!"
            reshow_menu
        end
    end

    def end_program
        puts "Come Back Soon!"
        exit
    end

    def ask_for_letter
        puts "Type a letter to list spells that begin with that letter."
        input = gets.chomp.downcase
        begin
            input = input.downcase
        rescue
            puts "Invalid input #{input}"
            end_program
        end
        input 
    end
    
    def find_spells(letter)
        spell_array = Spell.all  
        matching_spells = spell_array.find_all do |spell| 
            name = spell.get_spell_name
            name[0].downcase == letter
        end
        
        matching_spells
    end
    
    def run_letter
        
        letter = ask_for_letter
        
        matching_spells = find_spells(letter)
        if matching_spells.length > 0                         
            puts "Matching Spells : "
            matching_spells.each do |spell|
                puts "  #{spell.get_spell_name}"
            end
        else puts "No spells found starting with #{letter}"
        end
        end_program
    end
end