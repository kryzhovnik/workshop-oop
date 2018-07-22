require 'open-uri'
require 'nokogiri'

$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

module ConvertFeed
  autoload :Reader,    'convert_feed/reader'
  autoload :Converter, 'convert_feed/converter'
  autoload :Feed,      'convert_feed/feed'
  autoload :Parser,    'convert_feed/parser'

  def self.run(source:, output: nil, sort: nil, limit: nil)
    options = {
      output: output,
      sort: sort,
      limit: limit
    }

    code = Reader.new.read(source)
    converter = Converter.new(options)

    converter.convert(code)
  end
end
