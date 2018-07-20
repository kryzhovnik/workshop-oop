module ConvertFeed
  class Converter
    attr_reader :code, :output

    def initialize(code:, output:)
      @code, @output = code, output
    end

    def convert
      @code
    end
  end
end
