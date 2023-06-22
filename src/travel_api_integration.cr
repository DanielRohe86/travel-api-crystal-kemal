# require "json"
# require "kemal"

# base_url = "https://rickandmortyapi.com/api"

# def create_travel_plan(travel_stops : Array(Int32)) : Hash(String, JSON::Any)? 
#   url = "#{base_url}/travel-plans"
#   payload = travel_stops.to_json
#   response = HTTP::Client.post(url, body: payload, headers: {"Content-Type" => "application/json"})

#   if response.status_code == 201
#     puts "Travel plan created successfully!"
#     JSON.parse(response.body).as(Hash(String, JSON::Any))
#   else
#     puts "Failed to create travel plan."
#     nil
#   end
# end

# def get_travel_plans : Array(Hash(String, JSON::Any))?
#   url = "#{base_url}/travel-plans"
#   response = HTTP::Client.get(url)

#   if response.status_code == 200
#     JSON.parse(response.body).as(Array(Hash(String, JSON::Any)))
#   else
#     puts "Failed to retrieve travel plans."
#     nil
#   end
# end

# get "/travel-plans" do |env|
#   env.response.content_type = "application/json"
#   env.response.status_code = 200
#   travel_plans.to_json
# end

# post "/travel-plans" do |env|
#   env.response.content_type = "application/json"
#   env.response.status_code = 201

#   travel_stops = JSON.parse(env.request.body.to_s)
#   travel_plan = Hash(String, JSON::Any).new
#   travel_plan["id"] = JSON::Any.new((travel_plans.size + 1).to_s)
#   travel_plan["travel_stops"] = travel_stops
#   travel_plans << travel_plan

#   travel_plan.to_json
# end

# Kemal.run

# created_plan = create_travel_plan([1, 2])
# if created_plan
#   puts "Created Travel Plan:"
#   puts JSON.pretty_generate(created_plan)
# end

# all_plans = get_travel_plans
# if all_plans
#   puts "All Travel Plans:"
#   puts JSON.pretty_generate(all_plans)
# end
