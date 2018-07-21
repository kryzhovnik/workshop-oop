require_relative "../spec_helper"
require_relative "../../lib/convert_feed/converter"

describe ConvertFeed::Converter do
  it "converts" do
    converter = ConvertFeed::Converter.new(code: '', options: {})
    expect(converter).to respond_to(:convert)
  end
end
