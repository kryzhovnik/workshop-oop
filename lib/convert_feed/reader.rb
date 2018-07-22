module ConvertFeed
  module Reader
    autoload :FileReader,  'convert_feed/reader/file_reader'
    autoload :HTTPReader,  'convert_feed/reader/http_reader'
    autoload :STDINReader, 'convert_feed/reader/stdin_reader'

    def self.read(source)
      type = choose_type(source)
      type.read(source)
    end

    private
      def self.choose_type(source)
        if file?(source)
          FileReader
        elsif http?(source)
          HTTPReader
        else
          STDINReader
        end
      end

      def self.file?(source)
        if source.is_a?(String)
          path = ::File.expand_path(source)
          ::File.exists?(path)
        else
          false
        end
      end

      def self.http?(source)
        source.is_a?(String) && source =~ URI::regexp
      end
  end
end
