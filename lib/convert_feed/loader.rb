require 'open-uri'

module ConvertFeed
  class Loader
    def initialize(source)
      @source = source
    end

    def load
      open(@source) { |io| io.read }
    end
  end
end
