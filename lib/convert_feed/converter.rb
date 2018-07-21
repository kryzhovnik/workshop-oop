module ConvertFeed
  class Converter
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def convert(code)
      code
    end
  end
end
