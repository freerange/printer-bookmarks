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
    @title = if title_element
      title_element.at("span").remove # Remove the format from the title
      title_element.inner_text.strip
    else
      ""
    end

    cover_image_url_element = doc.at("#prodImage")
    @cover_image_url = if cover_image_url_element
      url = cover_image_url_element.attributes["src"].value
      url =~ /(.*\/images\/.*\/.*)\..*(\.jpg)/
      $1 + $2
    else
      ""
    end
  end
end