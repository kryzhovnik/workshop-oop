module ConvertFeed
  module Reader
    module STDINReader
      def self.read(source)
        STDIN.read
      end
    end
  end
end
