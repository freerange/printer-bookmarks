require 'test_helper'
require 'rack/test'
require 'webmock/test_unit'
require 'nokogiri'
require File.expand_path('../../server', __FILE__)

class ServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_bookmark_generation
    html_file = File.expand_path("../fixtures/vanishing-point-amazon-page.html", __FILE__)
    stub_request(:get, "example.com").to_return(body: File.read(html_file))

    get '/bookmark', url: 'http://example.com'

    doc = Nokogiri::HTML(last_response.body)
    assert_equal "Vanishing Point [Paperback]", doc.at("#book-title").inner_text
    assert_equal "http://ecx.images-amazon.com/images/I/515W2DBJURL._SL500_AA240_.jpg", doc.at("#cover-image").attributes['src'].value
  end
end