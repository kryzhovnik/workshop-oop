module ConvertFeed
  class Reader
    class FileReader
      def self.can_use?(source)
        if source.is_a?(String)
          path = ::File.expand_path(source)
          ::File.exists?(path)
        else
          false
        end
      end

      def read(source)
        path = ::File.expand_path(source)
        File.open(path, 'r') { |f| f.read }
      end
    end
  end
end
