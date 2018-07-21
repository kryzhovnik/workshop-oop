require 'open-uri'

require_relative 'convert_feed/reader'
require_relative 'convert_feed/simple_reader'
require_relative 'convert_feed/converter'

module ConvertFeed
  def self.run(options)
    source = options.delete(:source)

    code = SimpleReader.new.read(source)
    converter = Converter.new(options)
    result = converter.convert(code)

    STDOUT.puts result
  end
end
