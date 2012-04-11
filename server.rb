$LOAD_PATH << File.expand_path("../lib", __FILE__)

require 'bundler/setup'
require 'sinatra'

require 'amazon_book'

get '/' do
  "Demo bookmarks service for http://printer.gofreerange.com"
end

get '/bookmark' do
  book = AmazonBook.from_external_source(params[:url])
  haml :bookmark, locals: {book: book}
end