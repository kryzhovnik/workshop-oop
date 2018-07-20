require 'open-uri'

require_relative 'convert_feed/loader'
require_relative 'convert_feed/converter'

module ConvertFeed
  def self.run(options)
    output = options.fetch(:out)
    source = options.fetch(:source)
    code = Loader.new(source).load

    converter = Converter.new(code: code, output: output)
    result = converter.convert

    STDOUT.puts result
  end
end
