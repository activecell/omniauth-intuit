require 'rubygems'
require 'bundler'
Bundler.require

require 'sinatra/base'
require 'omniauth-intuit'
require 'crack'
require 'rack-ssl-enforcer'


class App < Sinatra::Base
  get '/' do
    @blue_dot_url = ""
    @intuit_connect_url = "#{request.url}auth/intuit"
    erb :auth
  end

  get '/bye' do
     erb :bye
   end

  get '/auth/:provider/callback' do

    puts "================"
    puts params[:oauth_token]
    puts params[:oauth_verifier]
    puts params[:realmId]
    puts params[:dataSource]
    puts "================"
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie
# use Rack::SslEnforcer

config = YAML.load(File.read('config.yml'))
use OmniAuth::Builder do
  provider :intuit, config['INTUIT_CONSUMER_KEY'], config['INTUIT_CONSUMER_SECRET']
end

run App.new
