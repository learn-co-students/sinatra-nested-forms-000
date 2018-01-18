require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :'root'
    end

    get '/pirates' do
      @pirates = Pirate.all
      erb :'pirates/index'
    end

    get '/new' do
      erb :'pirates/new'
    end

    get '/pirates/:name' do
      @pirate = Pirate.find(params[:name])
      erb :'/pirates/show'
    end

    post '/pirates' do
     @pirate = params["pirate"]
     @ships = params["pirate"]["ships"]

     erb :'/pirates/show'
    end
  end
end
=begin
params = {"pirate"=>{ "name"=>"Ian", "weight"=>"165", "height"=>"95",
          "ships"=>[{"name"=>"Titanic", "type"=>"Steam Liner", "booty"=>"Silver"},
                    {"name"=>"Carpathia", "type"=>"Rescue Ship", "booty"=>"Inner Tubes"}] }
          }
=end
