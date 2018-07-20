require 'open-uri'

require_relative 'convert_feed/loader'
require_relative 'convert_feed/converter'

module ConvertFeed
  def self.run(options)
    source = options.delete(:source)
    code = Loader.new(source).load

    converter = Converter.new(code: code, options: options)
    result = converter.convert

    STDOUT.puts result
  end
end
