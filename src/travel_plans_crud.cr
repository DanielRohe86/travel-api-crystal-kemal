require "kemal"
# require "json"

module Api
  VERSION = "0.1.0"
 
  post "/travel-plans/:id" do |context|
    id = context.params.url["id"]    
    travel_stops = context.params.json["travel_stops"]
    "{
      id: #{id},
    travel_stops: #{travel_stops}
    }"    
  end
end

Kemal.run