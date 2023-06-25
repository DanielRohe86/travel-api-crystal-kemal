require "json"
require "kemal"

# fetch api
def get_travel_plans(base_url : String) : Array(String)?
  url = "#{base_url}/location"
  response = HTTP::Client.get(url)
  planets = [] of String

  if response.status_code == 200
    json = JSON.parse(response.body.to_s)

    iterator = 0
    while iterator <= 19
      results = json["results"][iterator]["name"].to_s
      planets << results
      iterator += 1
    end

    planets
  else
    puts "Failed to retrieve travel plans."
    nil
  end
end

base_url = "https://rickandmortyapi.com/api"
all_plans = get_travel_plans(base_url)
puts all_plans

Kemal.run

