class Book
  attr_reader :title, :cover_image_url
  def initialize(title, cover_image_url)
    @title, @cover_image_url = title, cover_image_url
  end
end