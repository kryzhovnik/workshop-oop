#!/usr/bin/env ruby

require 'optparse'
require_relative "../lib/convert_feed"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: convert-feed.rb [options] source"

  opts.on("--out [FORMAT]", [:rss, :atom], "Output format (rss, atom)") do |f|
    options[:out] = f
  end
end.parse!

options[:source] = ARGV[0]

raise OptionParser::MissingArgument if options[:out].nil?
raise OptionParser::MissingArgument if options[:source].nil?

ConvertFeed.run(options)
