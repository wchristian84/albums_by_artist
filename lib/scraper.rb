require "open-uri"
require "nokogiri"
require "json"

class Scraper
    URL = "https://theaudiodb.p.rapidapi.com/searchalbum.php?s="

    def self.scrape_albums(search)
        modified_search = search.gsub(" ", "_")
        puts "Fetching data . . . "
        request = Nokogiri::HTML(URI.open("#{URL}#{modified_search}", 
            "X-RapidAPI-Key" => "5b11367d54msh106374dd10616e9p15a073jsn0628701dd20f",
            "X-RapidAPI-Host" => "theaudiodb.p.rapidapi.com"))

        scraped_data = JSON.parse(request.text)

        scraped_data["album"].each do |album|
            puts "| #{album["strAlbum"]} | #{album["intYearReleased"]} |"
        end
    end
end