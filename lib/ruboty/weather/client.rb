require "faraday"
require "faraday_middleware"

module Ruboty
  module Weather
    class Client
      LIVEDOOR_WEATHER_API_URL = 'http://weather.livedoor.com/forecast/webservice/json/v1'
      #TODO parse this http://weather.livedoor.com/forecast/rss/primary_area.xml
      CITIES = {
        tokyo: 130010,
        chiba: 120010,
        yokohama: 140010
      }

      def initialize
        @client = Faraday.new do |connection|
          connection.adapter :net_http
          connection.response :json
        end
      end

      def get(city_code=default_city)
        response = @client.get("#{url}?city=#{city_code}").body
        response['forecasts'][0]['telop']
      end

      private

      def url
        LIVEDOOR_WEATHER_API_URL
      end

      def cities
        CITIES
      end

      def default_city
        ENV['RUBOTY_WEATHER_CITY'] || 130010 #tokyo
      end
    end
  end
end
