require_relative 'reader/file_reader'
require_relative 'reader/http_reader'
require_relative 'reader/stdin_reader'

module ConvertFeed
  class Reader
    TYPES = []

    def self.register_type(type)
      TYPES << type
    end

    register_type HTTPReader
    register_type FileReader
    register_type STDINReader

    def read(source)
      type = TYPES.find { |t| t.can_use?(source) } or raise "Unrecognized source"
      type.new.read(source)
    end
  end
end
