require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'net/http'
require 'json'

get '/' do
  uri =URI("https://itunes.apple.com/search")
  uri.query = URI.encode_www_form({ term: "Maroon 5", country: "US",media: "music", limit: 10})
  res = Net::HTTP.get_response(uri)
  returned_json = JSON.parse(res.body)
  @musics = returned_json["results"]

  erb :index
end