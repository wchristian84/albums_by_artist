class CLI
    def run
        User.seed
        signup_or_login
        menu
    end

    def login
        authenticate = false
        while authenticate == false
            puts "Please enter your username."
            username = gets.chomp
            puts "Please enter your password."
            password = gets.chomp

            if User.authenticate_user(username, password)
                authenticate = true
                puts "Login successful"
            end
        end
    end
    
    def menu
        user_input = ""

        while user_input != 'exit'
            puts "Enter artist to search for albums."
            user_input = gets.chomp

            break if user_input == 'exit'
            Scraper.scrape_albums(user_input)
        end
    end
    
    def sign_up
        puts "Please enter a username."
        username = gets.chomp
        puts "Please enter a password."
        password = gets.chomp
        puts "Sign up successful."
        User.new(username, password)
        puts "Logging in..."
        User.authenticate_user(username, password)
    end
    
    def signup_or_login
        user_input = ""
        while user_input != "exit"
            puts "Do you wish to login or sign up?"
            user_input = gets.chomp
            if user_input == "login"
                login
                break;
            elsif user_input == "sign up"
                sign_up
                break;
            end
        end
    end
end
