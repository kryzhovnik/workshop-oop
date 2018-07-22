module ConvertFeed
  class Feed
    def initialize(tree)
      @tree = tree
    end

    def export(format)
      @tree
    end

    def sort(direction); end

    def limit(count); end
  end
end
