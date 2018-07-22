module ConvertFeed
  module Reader
    autoload :FileReader,  'convert_feed/reader/file_reader'
    autoload :HTTPReader,  'convert_feed/reader/http_reader'
    autoload :STDINReader, 'convert_feed/reader/stdin_reader'

    def self.read(source)
      type = if file?(source)
        FileReader
      elsif http?(source)
        HTTPReader
      else
        STDINReader
      end

      type.read(source)
    end

    def self.file?(source)
      if source.is_a?(String)
        path = ::File.expand_path(source)
        ::File.exists?(path)
      else
        false
      end
    end

    def self.http?
      source.is_a?(String) && source =~ URI::regexp
    end
  end
end
