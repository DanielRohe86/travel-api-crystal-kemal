require "json"
require "kemal"

# fetch api
def get_travel_plans(base_url : String) : JSON::Any?
  url = "#{base_url}/location"
  response = HTTP::Client.get(url)

  if response.status_code == 200
    json = JSON.parse(response.body.to_s)
    puts json.to_pretty_json
    json
  else
    puts "Failed to retrieve travel plans."
    nil
  end
end

Kemal.run do
  base_url = "https://rickandmortyapi.com/api"
  all_plans = get_travel_plans(base_url)
end
