module ConvertFeed
  class Feed
    def initialize(code)
      parser = Parser.get(code)
      @tree = parser.parse
    end

    def export(format)
      @tree
    end

    def sort(direction); end

    def limit(count); end
  end
end
