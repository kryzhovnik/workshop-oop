module ConvertFeed::Parser
  class Base
    attr_reader :doc

    def initialize(doc)
      @doc = doc
    end

    def parse
      {
        title: title,
        link: link,
        subtitle: subtitle,
        published: published,
        updated: updated,
        generator: generator,
        category: category,
      # lang
        id: id,
        author: {
          name: author_name,
          email: author_email
        },
        items: items
      }
    end

    def self.format
      name.match(/([^:]+)\Z/)[1].downcase
    end

    def format
      self.class.format
    end

    private
      def first_text(node, name)
        first_node = first(node, name)
        first_node.text if first_node
      end

      def first(node, name)
        find(node, name).first
      end

      def find(node, name)
        node.xpath(name)
      end
  end
end
