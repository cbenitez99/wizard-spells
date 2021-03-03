class CLI

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
            puts "Choose a spell: "
        end
#         spell_list

#     end

#     def spell_list
#        #list spells with the api
#     end

# end