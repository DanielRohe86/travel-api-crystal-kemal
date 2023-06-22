require "json"
require "kemal"
require "http/client"

travel_plans = [] of Hash(String, JSON::Any)

# def create_travel_plan(base_url : String, travel_stops : Array(Int32)) : JSON::Any? 
#   url = "#{base_url}/travel-plans"
#   payload = travel_stops.to_json
#   response = HTTP::Client.post(url, body: payload, headers: HTTP::Headers{"Content-Type" => "application/json"})

#   if response.status_code == 201
#     puts "Travel plan created successfully!"
#     JSON.parse(response.body.to_s)
#   else
#     puts "Failed to create travel plan."
#     nil
#   end
# end

def get_travel_plans(base_url : String) : Array(String)?
  url = "#{base_url}/travel-plans"
  response = HTTP::Client.get(url)
  
  if response.status_code == 200
    puts response.to_s
    JSON.parse(response.body.to_s).as(Array(String))
  else
    puts "Failed to retrieve travel plans."
    nil
  end
end

# post "/travel-plans" do |env|
#   env.response.content_type = "application/json"
#   env.response.status_code = 201

#   travel_stops = JSON.parse(env.request.body.to_s)
#   travel_plan = {"id" => (travel_plans.size + 1).to_s, "travel_stops" => travel_stops}
#   travel_plans << travel_plan

#   travel_plan.to_json
# end

get "/travel-plans" do |env|
  env.response.content_type = "application/json"
  env.response.status_code = 200
  travel_plans.to_json
end


Kemal.run do
  base_url = "https://rickandmortyapi.com/api"

  # created_plan = create_travel_plan(base_url, [1, 2])
  # if created_plan
  #   puts "Created Travel Plan:"
  #   puts created_plan.to_pretty_json
  # end

  all_plans = get_travel_plans(base_url)
  if all_plans
    puts "All Travel Plans:"
    puts all_plans.to_pretty_json
  end
end
