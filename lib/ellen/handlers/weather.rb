module Ellen
  module Handlers
    class Weather < Base
      on /weather( me)? (?<keyword>\w+)/, name: "weather", description: "Fetch weather info from livedoor API"

      def weather(message)
        message.reply(fetch(message[:keyword]))
      end

      private

      def fetch(query)
        Ellen::Weather::Client.new.get(query)
      end
    end
  end
end
