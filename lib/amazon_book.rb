require 'nokogiri'
require 'open-uri'

class AmazonBook
  def self.from_external_source(external_source)
    html = open(external_source)
    new(html)
  end

  attr_reader :title, :cover_image_url

  def initialize(html)
    doc = Nokogiri::HTML(html)
    title_element = doc.at("#btAsinTitle")
    @title = title_element ? title_element.inner_text : ""
    cover_image_url_element = doc.at("#prodImage")
    @cover_image_url = cover_image_url_element ? cover_image_url_element.attributes["src"].value : ""
  end
end