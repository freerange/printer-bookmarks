#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path("../lib/", __FILE__)

require 'bundler/setup'
require 'haml'

require 'amazon_book'

unless html_source = ARGV.shift
  puts "Usage: #{__FILE__} html-source"
  puts "  where html-source is a URL or local html page"
  exit 1
end

book = AmazonBook.from_external_source(html_source)

bookmark_template = File.read("templates/bookmark.html.haml")
engine = Haml::Engine.new(bookmark_template)
puts engine.render(binding)