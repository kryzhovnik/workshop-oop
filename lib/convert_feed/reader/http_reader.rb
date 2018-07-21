require 'open-uri'

module ConvertFeed
  class Reader
    class HTTPReader
      def self.can_use?(source)
        source.is_a?(String) && source =~ URI::regexp
      end

      def read(source)
        open(source) { |io| io.read }
      end
    end
  end
end
