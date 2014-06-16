require "faraday"
require "faraday_middleware"

module Ruboty
  module Weather
    class Client
      LIVEDOOR_WEATHER_API_URL = 'http://weather.livedoor.com/forecast/webservice/json/v1'

      def initialize
        @client = Faraday.new do |connection|
          connection.adapter :net_http
          connection.response :json
        end
      end

      def get(city_code=default_city)
        response = @client.get("#{url}?city=#{city_code}").body

        forecasts = response['forecasts'].map do |forecast|
          "#{forecast['date']}: #{emojilize!(forecast['telop'])} (#{temperature_to_s(forecast['temperature'])})"
        end
        forecasts.join("\n")
      end

      private

      def url
        LIVEDOOR_WEATHER_API_URL
      end

      def default_city
        ENV['RUBOTY_WEATHER_CITY'] || 130010 #tokyo
      end

      def emojilize!(telop)

        telop.gsub!(/時々/, "\u{2194}")
        telop.gsub!(/のち/, "\u{27A1}")

        emojis = {
          "晴" => "\u{2600}",
          "曇" => "\u{2601}",
          "雨" => "\u{2614}",
          "雷" => "\u{26A1}",
          "雪" => "\u{26C4}",
        }.each do |k, v|
          telop.gsub!(/#{k}/, v)
        end

        telop
      end

      def temperature_to_s(temperature)
        min = (temperature['min'] ? temperature['min']['celsius'] : '-')
        max = (temperature['max'] ? temperature['max']['celsius'] : '-')

        "#{min}/#{max}"
      end
    end
  end
end
