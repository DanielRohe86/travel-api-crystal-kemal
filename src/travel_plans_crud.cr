require "kemal"
# require "json"

module Api
  VERSION = "0.1.0"
 
  post "/travel-plans/:id" do |context|
    id = context.params.url["id"]    
    travel_array = context.params.body["travel_array"]
    "#{id}: #{travel_array}"
    # if !travel_array
    #   error = {message: "must give"}.to_json
    #   halt context, status_code: 403, response: error
    # end
  
  #   { id: "#{id}",
  #   travel_stops: "#{travel_array}"
  
  # }     
  end
end

Kemal.run