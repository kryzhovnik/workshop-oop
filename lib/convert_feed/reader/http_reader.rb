require 'open-uri'

module ConvertFeed
  module Reader
    module HTTPReader
      def self.read(source)
        open(source) { |io| io.read }
      end
    end
  end
end
