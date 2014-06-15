module Ruboty
  module Handlers
    class Weather < Base
      on /weather/, name: "weather", description: "Fetch weather info from livedoor API"

      def weather(message)
        message.reply(fetch)
      end

      private

      def fetch
        Ruboty::Weather::Client.new.get
      end
    end
  end
end
