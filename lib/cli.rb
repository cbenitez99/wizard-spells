class CLI
    def initialize 
        API.new.get_spell_data
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
        puts "Welcome to Hogwarts, Wizard!"
        sleep(1)
    end

    def menu
        puts "Here are your spells: "
        sleep(2)
        spell_list
    end

    def spell_list 
        array_of_spells = Spells.all
        array_of_spells_length = array_of_spells.length

        counter = 1
        while counter <= array_of_spells_length
            index = counter - 1
            spell_object = array_of_spells[index]  
            puts "#{counter}. #{spell_object.spell}"
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
        input_number = input.to_i
        array_of_spells = Spells.all
        array_of_spells_length = array_of_spells.length
        if input_number.between?(1, array_of_spells_length)

            index = input_number - 1
            spell_object = array_of_spells[index]
            spell_name = spell_object.spell
            spell_effect = spell_object.effect

            puts "#{spell_name} effect :"
            puts "#{spell_effect}\n"
        else
            puts "BAHAHA!!! THAT'S NOT A VALID NUMBER!?? COME BACK WHEN YOU DECIDE TO TAKE THINGS MORE SERIOUSLY."
        end
        reshow_menu
    end

    def reshow_menu
        puts "Would you like to return to the menu? ['Y'] or ['N']"
        input = gets.chomp.downcase
        if input == 'n'
            end_program
        elsif input == 'y'
            menu 
        else 
            puts "CHOOSE A VAILD OPTION YOU BUFFOON!"
            reshow_menu
        end
    end

    def end_program
        puts "Come Back Soon!"
        exit
    end

end