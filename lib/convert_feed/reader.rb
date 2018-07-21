require 'open-uri'

module ConvertFeed
  class Reader
    TYPES = []

    def read(source)
      type = TYPES.find { |t| t.can_use?(source) } or raise "Unrecognized source"
      type.new.read(source)
    end

    class AbstractReader
      def self.can_use?(source); raise NotImplementedError; end
      def read(source); raise NotImplementedError; end
    end

    class HTTPReader < AbstractReader
      def self.can_use?(source)
        source.is_a?(String) && source =~ URI::regexp
      end

      def read(source)
        open(source) { |io| io.read }
      end
    end
    TYPES << HTTPReader

    class FileReader < AbstractReader
      def self.can_use?(source)
        if source.is_a?(String)
          p source
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
    TYPES << FileReader

    class STDINReader < AbstractReader
      def self.can_use?(source)
        true
      end

      def read(source)
        STDIN.read
      end
    end
    TYPES << STDINReader
  end
end
