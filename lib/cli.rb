class CLI
    def run
        menu
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
end