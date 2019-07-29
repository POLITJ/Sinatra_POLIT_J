
require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
     Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
    end

   get '/gossips/:index' do
    erb :show_gossip, locals: {gossips: Gossip.find(params['index'].to_i), index: params['index']}
    end

end


  
