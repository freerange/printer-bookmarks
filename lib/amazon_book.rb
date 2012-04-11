require 'nokogiri'

class AmazonBook
  attr_reader :title, :cover_image_url

  def initialize(html)
    doc = Nokogiri::HTML(html)
    @title = (doc/"#btAsinTitle").first.inner_text
    @cover_image_url = (doc/"#prodImage").first.attributes["src"].value
  end
end