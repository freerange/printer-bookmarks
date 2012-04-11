#!/usr/bin/env ruby

require 'bundler/setup'
require 'nokogiri'
require 'haml'

require 'open-uri'

unless html_source = ARGV.shift
  puts "Usage: #{__FILE__} html-source"
  puts "  where html-source is a URL or local html page"
  exit 1
end

html = open(html_source)
doc = Nokogiri::HTML(html)

book_title = (doc/"#btAsinTitle").first.inner_text
cover_image_url = (doc/"#prodImage").first.attributes["src"].value

bookmark_template = File.read("templates/bookmark.html.haml")
engine = Haml::Engine.new(bookmark_template)
puts engine.render(binding)