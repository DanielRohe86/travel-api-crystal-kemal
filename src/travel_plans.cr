require "kemal"

# In-memory storage for travel plans
travel_plans = [] of Hash(String, JSON::Any)

# GET /travel-plans
get "/travel-plans" do |env|
  env.response.content_type = "application/json"
  env.response.status_code = 200
  travel_plans.to_json
end

# POST /travel-plans
post "/travel-plans" do |env|
  env.response.content_type = "application/json"
  env.response.status_code = 201

  # Retrieve the travel stops from the request body
  travel_stops = JSON.parse(env.request.body.to_s)

  # Create a new travel plan
  travel_plan = Hash(String, JSON::Any).new
  travel_plan["id"] = JSON::Any.new((travel_plans.size + 1).to_s)
  travel_plan["travel_stops"] = travel_stops

  # Add the travel plan to the storage
  travel_plans << travel_plan

  travel_plan.to_json
end

Kemal.run
