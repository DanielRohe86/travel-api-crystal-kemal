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


# post "/travel-plans" do |env|
#   env.response.content_type = "application/json"
#   env.response.status_code = 201

#   travel_stops = JSON.parse(env.request.body.to_s)
#   travel_plan = {"id" => (travel_plans.size + 1).to_s, "travel_stops" => travel_stops}
#   travel_plans << travel_plan

#   travel_plan.to_json
# end

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

# get "/travel-plans" do |env|
#   env.response.content_type = "application/json"
#   env.response.status_code = 200
#   travel_plans.to_json
# end

Kemal.run do
  base_url = "https://rickandmortyapi.com/api"

  # created_plan = create_travel_plan(base_url, [1, 2])
  # if created_plan
  #   puts "Created Travel Plan:"
  #   puts created_plan.to_pretty_json
  # end

  all_plans = get_travel_plans(base_url)
  # if all_plans
  #   puts "All Travel Plans:"
  #   puts all_plans.to_pretty_json
  # end
end

# Parte após print no terminal

# require "json"
# require "kemal"
# require "http/client"

# travel_plans = [] of Hash(String, JSON::Any)

# def fetch_location_details(location_id : Int32) : JSON::Any
#   response = HTTP::Client.get("https://rickandmortyapi.com/api/location/#{location_id}")
#   JSON.parse(response.body)
# end

# get "/travel-plans" do |env|
#   optimize = env.params.get("optimize")?.to_b
#   expand = env.params.get("expand")?.to_b

#   if optimize
#     # Code for optimizing the travel stops array goes here
#   end

#   if expand
#     travel_plans.each do |plan|
#       plan["travel_stops"].map! do |location_id|
#         fetch_location_details(location_id)
#       end
#     end
#   end

#   env.response.content_type = "application/json"
#   env.response.status_code = 200
#   env.response.print travel_plans.to_json
# end

# Kemal.run do
#   base_url = "https://rickandmortyapi.com/api"

#   all_plans = get_travel_plans(base_url)
#   if all_plans
#     travel_plans = all_plans.map { |plan| {"id" => plan["id"].to_i, "travel_stops" => plan["travel_stops"]} }
#   end
# end
