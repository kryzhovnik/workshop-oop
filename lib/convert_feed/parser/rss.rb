module ConvertFeed::Parser
  class RSS < Base
    private
      def title
        first_text(doc, '/rss/channel/title')
      end

      def category
        first_text(doc, '/rss/channel/category')
      end

      def generator
        first_text(doc, '/rss/channel/generator')
      end

      def subtitle
        first_text(doc, '/rss/channel/description')
      end

      def link
        first_text(doc, '/rss/channel/link')
      end

      def updated
        first_text(doc, '/rss/channel/lastBuildDate')
      end

      def published
        first_text(doc, '/rss/channel/pubDate')
      end

      def author_name
      end

      def author_email
        first_text(doc, '/rss/channel/managingEditor')
      end

      def id
        first_text(doc, '/rss/channel/guid')
      end

      def items
        find(doc, '/rss/channel/item').map do |node|
          {
            title: first_text(node, 'title'),
            link: first_text(node, 'link'),
            id: first_text(node, 'guid'),
            updated: first_text(node, 'pubDate'),
            summary: first_text(node, 'description')
          }
        end
      end
  end
end
