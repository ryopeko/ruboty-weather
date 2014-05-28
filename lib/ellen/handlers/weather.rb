module Ellen
  module Handlers
    class Weather < Base
      on /weather( me)? (?<keyword>.+)/, name: "weather", description: "Fetch weather info from livedoor API"

      def weather(message)
        p message
        fetch(message[:keyword])
      end

      private

      def fetch(query)
        Ellen::Weather::Client.new.get('130010')
      end
    end
  end
end
