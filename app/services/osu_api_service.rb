# https://github.com/jnunemaker/httparty was used to get familiar with httparty
# https://dev.to/daviducolo/rails-service-objects-a-tiny-guide-11d2

# Module to use for other files use variable = OsuApiService::OsuAPI.new to create the object
# Module to use for other files use variable = OsuApiService::OsuAPI.new to create the object

module OsuApiService
    # custom class that we'll be using to grab data from the api
    # order to properly use object: 
    #  obj = OsuAPI.new => obj.initialize response => object.findQuery => object.fetch_From_Query
    class OsuAPI 
        include HTTParty
        # Method in HTTParty that uses the url of the api as the base for how we may change the query
        base_uri 'https://contenttest.osu.edu/v2/classes/search'
  
        # Initializes the OsuAPI with the response
        # The full response such as https://contenttest.osu.edu/v2/classes/search [...] is made before initialization
        # example response would be ?q=cse&term=1248&campus=col&catalog-number=2xxx&p=2
        def initialize(response)
            @query = response 
            # Stores the data in the apu that was stored in query
            @data = self.class.get(@query)
            #findQuery might be placed here instead
         end
         def change_response(response)
             @query = response
             # Stores the data in the apu that was stored in query
             @data = self.class.get(@query)
             #findQuery might be placed here instead
         end
         # This will take a initialized OsuAPI object and returns a parsed 
        def fetch_From_Query 
            # This will show each course from the query
            @data['data']['courses']
        end

        def fetch_data_info_From_Query 
            # This will show each course from the query
            @data['data']
        end

    end
end

#example 
# A quick way to use this in the terminal do
# bin/rails c
# OsuApiService              // an error showing up is fine here
# course = apiDemo
# course[inputanynumber]  // to see the data for the course 
def apiDemo

    osu = OsuApiService::OsuAPI.new
    response =  '?q=cse' #'?q=cse&term=1248&campus=col&catalog-number=2xxx&p=2'
    osu.initialize response
    osu.fetch_From_Query

    # puts osu.class.get(response)   
    

end
