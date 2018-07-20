module ConvertFeed
  class Converter
    attr_reader :code, :options

    def initialize(code:, options:)
      @code, @options = code, options
    end

    def convert
      @code
    end
  end
end
