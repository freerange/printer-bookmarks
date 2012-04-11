require 'test_helper'
require 'amazon_book'

class AmazonBookHappyPathTest < Test::Unit::TestCase
  def setup
    html = File.read(File.expand_path("../fixtures/vanishing-point-amazon-page.html", __FILE__))
    @book = AmazonBook.new(html)
  end

  def test_should_parse_the_book_title
    assert_equal "Vanishing Point [Paperback]", @book.title
  end

  def test_should_parse_the_cover_image_url
    assert_equal "http://ecx.images-amazon.com/images/I/515W2DBJURL._SL500_AA240_.jpg", @book.cover_image_url
  end
end

class AmazonBookInvalidHtmlTest < Test::Unit::TestCase
  def setup
    @book = AmazonBook.new('invalid-html')
  end

  def test_should_return_an_empty_string_for_the_book_title
    assert_equal '', @book.title
  end

  def test_should_return_an_empty_string_for_the_image_url
    assert_equal '', @book.cover_image_url
  end
end

class AmazonBookClassMethodsTest < Test::Unit::TestCase
  def test_should_use_open_uri_to_handle_both_local_and_remote_html_files
    AmazonBook.expects(:open).with('path-to-external-html-file').returns('html')
    AmazonBook.from_external_source('path-to-external-html-file')
  end
end