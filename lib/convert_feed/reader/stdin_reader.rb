module ConvertFeed
  module Reader
    class STDINReader
      def self.can_use?(source)
        true
      end

      def read(source)
        STDIN.read
      end
    end
  end
end
