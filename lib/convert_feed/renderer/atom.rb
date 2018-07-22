module ConvertFeed
  module Renderer
    module Atom
      def self.render(tree)
        lines = []
        lines << '<?xml version="1.0" encoding="utf-8"?>'
        lines << '<feed xmlns="http://www.w3.org/2005/Atom">'
        # tree
        lines << '</feed>'
        lines.join("\n")
      end
    end
  end
end
