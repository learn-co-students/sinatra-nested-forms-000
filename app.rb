require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root 
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      pirate_attrs = [:name, :weight, :height]
      ship_attrs = [:name, :ship_type, :booty]

      @pirate = Pirate.create do |p|
        pirate_attrs.each { |attr| p.send("#{attr}=", params[:pirate][attr]) }
      end

      2.times do |i|
        @pirate.ships.create do |s|
          ship_attrs.each { |attr| s.send("#{attr}=", params[:pirate][:ships][i.to_s][attr]) }
        end
      end
      
      erb :'pirates/show'
    end
  end
end
