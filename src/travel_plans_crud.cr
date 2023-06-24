require "kemal"
# require "json"

module Api
  VERSION = "0.1.0"

  @@last_id = 0
 
  post "/travel-plans/" do |context|
    # id = context.params.url["id"] source for id retrieved from /:id
    @@last_id += 1
    id = @@last_id.to_s

    travel_stops = context.params.json["travel_stops"]
    context.response.status_code = 201    
    "{
      id: #{id},
    travel_stops: #{travel_stops}
    }"    
  end
end

Kemal.run