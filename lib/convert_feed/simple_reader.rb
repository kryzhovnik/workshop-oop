module ConvertFeed
  class SimpleReader
    def read(source)
      if url?(source)
        open(source) { |io| io.read }
      elsif file?(source)
        path = ::File.expand_path(source)
        File.open(path) { |f| f.read }
      else
        STDIN.read
      end
    end

    private
      def url?(source)
        source.is_a?(String) && source =~ URI::regexp
      end

      def file?(source)
        if source.is_a?(String)
          path = ::File.expand_path(source)
          ::File.exists?(path)
        else
          false
        end
      end
  end
end
