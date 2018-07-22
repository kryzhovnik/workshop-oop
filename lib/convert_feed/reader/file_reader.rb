module ConvertFeed
  module Reader
    module FileReader
      def self.read(source)
        path = ::File.expand_path(source)
        File.open(path, 'r') { |f| f.read }
      end
    end
  end
end
