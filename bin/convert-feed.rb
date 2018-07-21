#!/usr/bin/env ruby

require 'optparse'
require_relative "../lib/convert_feed"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: convert-feed.rb [options] source"

  opts.on("--out [FORMAT]", [:rss, :atom], "Output format (rss, atom)") do |value|
    options[:out] = value
  end
  opts.on("--sort [DIRECTION]", [:reverse, :date, :reverse_date],
          "Sorting items direction (reverse, date, reverse_date)") do |value|
    options[:sort] = value
  end
  opts.on("--limit [COUNT]", OptionParser::DecimalInteger,
          "Limit output items count") do |value|
    options[:limit] = value
  end
end.parse!

options[:source] = ARGV[0]

# raise OptionParser::MissingArgument if options[:source].nil?
raise OptionParser::MissingArgument if options[:out].nil?

ConvertFeed.run(options)
