require 'nokogiri'
require 'book'

class AmazonPageParser
  attr_reader :book

  def initialize(html)
    doc = Nokogiri::HTML(html)
    title = (doc/"#btAsinTitle").first.inner_text
    cover_image_url = (doc/"#prodImage").first.attributes["src"].value
    @book = Book.new(title, cover_image_url)
  end
end