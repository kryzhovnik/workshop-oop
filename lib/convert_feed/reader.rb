module ConvertFeed
  class Reader
    autoload :FileReader,  'convert_feed/reader/file_reader'
    autoload :HTTPReader,  'convert_feed/reader/http_reader'
    autoload :STDINReader, 'convert_feed/reader/stdin_reader'

    TYPES = []

    def self.register_type(type)
      TYPES << type
    end

    register_type FileReader
    register_type HTTPReader
    register_type STDINReader

    def read(source)
      type = TYPES.find { |t| t.can_use?(source) } or raise "Unrecognized source"
      type.new.read(source)
    end
  end
end
