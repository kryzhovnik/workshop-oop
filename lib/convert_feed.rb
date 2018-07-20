require 'open-uri'
require_relative 'convert_feed/converter'

module ConvertFeed
  def self.run(options)
    output = options.fetch(:out)
    source = options.fetch(:source)
    code = read_source(source)

    converter = Converter.new(code: code, output: output)
    result = converter.convert

    STDOUT.puts result
  end

  def self.read_source(source)
    text = nil
    open(source) do |io|
      text = io.read
    end
    text
  end
end
