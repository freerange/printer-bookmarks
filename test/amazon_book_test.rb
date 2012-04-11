require 'test_helper'
require 'amazon_book'

class AmazonBookTest < Test::Unit::TestCase
  def setup
    @html = File.read(File.expand_path("../fixtures/vanishing-point-amazon-page.html", __FILE__))
    @book = AmazonBook.new(@html)
  end

  def test_should_parse_the_book_title
    assert_equal "Vanishing Point [Paperback]", @book.title
  end

  def test_should_parse_the_cover_image_url
    assert_equal "http://ecx.images-amazon.com/images/I/515W2DBJURL._SL500_AA240_.jpg", @book.cover_image_url
  end
end