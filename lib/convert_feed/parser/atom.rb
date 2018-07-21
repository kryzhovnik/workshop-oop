module ConvertFeed::Parser
  class Atom < Base
    private
      def title
        first_text(doc, '/feed/title')
      end

      def category
        first_text(doc, '/feed/category')
      end

      def generator
        first_text(doc, '/feed/generator')
      end

      def subtitle
        first_text(doc, '/feed/subtitle')
      end

      def link
        if node = first(doc, '/feed/link')
          node.attr('href')
        end
      end

      def updated
        first_text(doc, '/feed/updated')
      end

      def published
        sorted = items.sort_by do |item|
          if value = item[:published]
            Time.parse(value)
          end
        end
        sorted.last && sorted.last[:published]
      end

      def author_name
        first_text(doc, '/feed/author/name')
      end

      def author_email
        first_text(doc, '/feed/author/email')
      end

      def id
        first_text(doc, '/feed/id')
      end

      def items
        find(doc, '/feed/entry').map do |node|
          if link_node = first(node, 'link')
            link = link_node.attr('href')
          end
          {
            title: first_text(node, 'title'),
            link: link,
            id: first_text(node, 'id'),
            updated: first_text(node, 'updated'),
            published: first_text(node, 'published'),
            summary: first_text(node, 'summary')
          }
        end
      end
  end
end
