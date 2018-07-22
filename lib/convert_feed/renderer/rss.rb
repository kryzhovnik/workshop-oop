module ConvertFeed
  module Renderer
    module RSS
      def self.render(tree)
        lines = []
        lines << '<?xml version="1.0" encoding="utf-8"?>'
        lines << '<rss version="2.0">'
        # tree
        lines << '</rss>'
        lines.join("\n")
      end
    end
  end
end
