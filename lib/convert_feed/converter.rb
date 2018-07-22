module ConvertFeed
  class Converter
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def convert(code)
      parser = Parser.get(code)
      format = options[:format] || parser.format

      tree = parser.parse

      feed = Feed.new(tree)
      feed.sort(options[:sort]) if options[:sort]
      feed.limit(options[:limit]) if options[:limit]

      feed.export(format)
    end
  end
end
