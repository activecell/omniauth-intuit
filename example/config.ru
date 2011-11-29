require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-intuit'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/intuit'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :intuit, ENV['INTUIT_CONSUMER_KEY'], ENV['INTUIT_CONSUMER_SECRET']
end

run App.new
