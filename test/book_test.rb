require 'test_helper'
require 'book'

class BookTest < Test::Unit::TestCase
  def setup
    @book = Book.new('title', 'cover-image-url')
  end

  def test_should_provide_access_to_its_title
    assert_equal 'title', @book.title
  end

  def test_should_provide_access_to_its_cover_image_url
    assert_equal 'cover-image-url', @book.cover_image_url
  end
end