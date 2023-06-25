require "json"
require "kemal"

# Fetch API and retrieve travel plans
def get_travel_plans(base_url : String) : {Array(String), Array(String), Array(String)}?
  url = "#{base_url}/location"
  response = HTTP::Client.get(url)
  planets = [] of String
  types = [] of String
  dimensions = [] of String

  if response.status_code == 200
    json = JSON.parse(response.body.to_s)

    iterator = 0
    while iterator <= 19
      results_planets = json["results"][iterator]["name"].to_s
      results_types = json["results"][iterator]["type"].to_s
      results_dimensions = json["results"][iterator]["dimension"].to_s

      planets << results_planets
      types << results_types
      dimensions << results_dimensions

      iterator += 1
    end

    {planets, types, dimensions}
  else
    puts "Failed to retrieve travel plans."
    return nil
  end
end

base_url = "https://rickandmortyapi.com/api"
all_plans = get_travel_plans(base_url)

if all_plans.nil?
  puts "No travel plans available."
else
  planets, types, dimensions = all_plans

  puts "Planets: #{planets[0]}"
  puts "Types: #{types[0]}"
  puts "Dimensions: #{dimensions[0]}"
end

Kemal.run

