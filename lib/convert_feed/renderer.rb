module ConvertFeed
  module Renderer
    autoload :Atom, 'convert_feed/renderer/atom'
    autoload :RSS,  'convert_feed/renderer/rss'

    def self.get(format)
      case format.to_s
      when 'atom'
        Atom
      when 'rss'
        RSS
      else
        raise 'Unrecognized output format type'
      end
    end
  end
end
