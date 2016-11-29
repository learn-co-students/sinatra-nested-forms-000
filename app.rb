require './environment'

module FormsLab
  class App < Sinatra::Base

  get '/' do 
    @pirate = params[:pirate]
    erb :'pirates/front_page'
  end

  get '/new' do
    erb :'pirates/new'
  end

  get '/pirate' do
    erb :'pirates/show'
  end

  post '/pirates' do
    @pirate = params[:pirate]
    erb :'pirates/show'
  end

  end
end
