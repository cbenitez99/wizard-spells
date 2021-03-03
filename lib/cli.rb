class CLI

    def run
        system("clear")
        greeting

        while menu != "2"
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
        puts "Would you like to see your spells?"
        list_options
        input = gets.chomp
        choose_option(input)
        return input
    end

    def list_options
        puts "1. Yes"
        puts "2. No"
    end

    def choose_option(option)
        case option
        when "1"
            puts "Choose a spell!"
        end

    end

end