module ConvertFeed
  module Parser
    autoload :Base, 'convert_feed/parser/base'
    autoload :Atom, 'convert_feed/parser/atom'
    autoload :RSS,  'convert_feed/parser/rss'

    def self.get(code)
      doc = Nokogiri::XML(code)
      doc.remove_namespaces!

      parser_type = if rss?(doc)
        Parser::RSS
      elsif atom?(doc)
        Parser::Atom
      else
        raise 'Unrecognized feed type'
      end

      parser_type.new(doc)
    end

    private
      def self.rss?(doc)
        !!doc.at_xpath('/rss')
      end

      def self.atom?(doc)
        !!doc.xpath('/feed')
      end
  end
end
