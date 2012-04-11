#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path("../lib/", __FILE__)

require 'bundler/setup'
require 'haml'

require 'open-uri'
require 'amazon_book'

unless html_source = ARGV.shift
  puts "Usage: #{__FILE__} html-source"
  puts "  where html-source is a URL or local html page"
  exit 1
end

html = open(html_source)
book = AmazonBook.new(html)

bookmark_template = File.read("templates/bookmark.html.haml")
engine = Haml::Engine.new(bookmark_template)
puts engine.render(binding)