$LOAD_PATH << File.expand_path("../lib", __FILE__)

require 'bundler/setup'
require 'sinatra'

require 'amazon_book'

get '/' do
  haml :index
end

get '/bookmarks/new' do
  haml :new
end

post '/bookmarks' do
  bookmark_url = "http://" + env["SERVER_NAME"] + "/bookmark?url=" + params[:amazon_url]
  print_url    = params[:printer_url] + "?url=" + bookmark_url
  redirect print_url
end

get '/bookmark' do
  book = AmazonBook.from_external_source(params[:url])
  haml :bookmark, locals: {book: book}
end