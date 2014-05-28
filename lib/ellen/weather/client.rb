require "faraday"
require "faraday_middleware"

module Ellen
  module Weather
    class Client
      LIVEDOOR_WEATHER_API_URL = 'http://weather.livedoor.com/forecast/webservice/json/v1'#?city=130010'

      def initialize(options)
        @options = options
        @client = Faraday.new do |connection|
          connection.adapter :net_http
          connection.response :json
        end
      end

      def get(city)
        @client.get("#{url}?city=#{city}").tap {|s| p s }
      end

      private

      def url
        LIVEDOOR_WEATHER_API_URL
      end
    end
  end
end
