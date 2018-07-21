require 'open-uri'
require 'nokogiri'

$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

module ConvertFeed
  autoload :Reader,       'convert_feed/reader'
  autoload :Converter,    'convert_feed/converter'

  def self.run(options)
    source = options.delete(:source)

    code = Reader.new.read(source)
    converter = Converter.new(options)

    converter.convert(code)
  end
end
