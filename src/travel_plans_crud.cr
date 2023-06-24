require "kemal"
# require "json"

module Api
  VERSION = "0.1.0"

  @@travel_plans = [] of String
  @@last_id = 0
 
  post "/travel-plans/" do |context|
    # id = context.params.url["id"] source for id retrieved from /:id
    @@last_id += 1
    id = @@last_id

    travel_stops = context.params.json["travel_stops"]
    travel_plan = %({"id": #{id}, "travel_stops": #{travel_stops}})   

    context.response.status_code = 201
    @@travel_plans << travel_plan
    json_array = "[" + @@travel_plans.join(",") + "]"

    json_array
  end
end

Kemal.run