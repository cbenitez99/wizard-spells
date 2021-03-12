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
        counter = 1
        while counter <= Spells.all.length
            index = counter - 1
            puts "#{counter}. #{Spells.all[index].spell}"
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
        if input.between?(1, Spells.all.length)
            index = input - 1 
            puts "#{Spells.all[index].spell} effect :"
            puts "#{Spells.all[index].effect}\n"
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
            puts "CHOOSE A VALID OPTION YOU BUFFOON!"
            reshow_menu
        end
    end

    def end_program
        puts "Come Back Soon!"
        exit
    end
end