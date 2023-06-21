require "http/client"
require "json"


base_url = "http://localhost:3000"


def create_travel_plan(travel_stops : Array(Int32)) : Hash(String, JSON::Any)? 
  url = "#{base_url}/travel-plans"
  payload = travel_stops.to_json
  response = HTTP::Client.post(url, body: payload, headers: {"Content-Type" => "application/json"})

  if response.status_code == 201
    puts "Travel plan created successfully!"
    JSON.parse(response.body).as(Hash(String, JSON::Any))
  else
    puts "Failed to create travel plan."
    nil
  end
end


def get_travel_plans : Array(Hash(String, JSON::Any))? 
  url = "#{base_url}/travel-plans"
  response = HTTP::Client.get(url)

  if response.status_code == 200
    JSON.parse(response.body).as(Array(Hash(String, JSON::Any)))
  else
    puts "Failed to retrieve travel plans."
    nil
  end
end


created_plan = create_travel_plan([1, 2])
if created_plan
  puts "Created Travel Plan:"
  puts JSON.pretty_generate(created_plan)
end

all_plans = get_travel_plans
if all_plans
  puts "All Travel Plans:"
  puts JSON.pretty_generate(all_plans)
end
