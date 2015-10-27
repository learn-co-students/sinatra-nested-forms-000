describe "Models:" do

  describe "Pirate" do

    before(:each) do
      Pirate.destroy_all
    end

  	it "exists" do
  	  expect { Pirate.new(name: "John", weight: "100", height: "180") }.not_to raise_error
  	end

  	it "should be istantiated correctly" do
  	  pirate = Pirate.create(name: "John", weight: "100", height: "180")
      expect(pirate.name).to eq("John")
      expect(pirate.weight).to eq("100")
      expect(pirate.height).to eq("180")
      expect(Pirate.count).to eq(1)
  	end
  
  end

  describe "Ship" do

    before(:each) do
      Ship.destroy_all
    end

  	it "exists" do
  	  expect { Ship.new(name: "Titanic", ship_type: "Submarine", booty: "Movies") }.not_to raise_error
  	end

  	it "should be istantiated correctly" do
  	  ship = Ship.create(name: "Titanic", ship_type: "Submarine", booty: "Movies")
      expect(ship.name).to eq("Titanic")
      expect(ship.ship_type).to eq("Submarine")
      expect(ship.booty).to eq("Movies")
      expect(Ship.count).to eq(1)
  	end

  end

  describe "Pirates own Ships" do
    
    before(:each) do
      Pirate.destroy_all
      Ship.destroy_all
    end

    let(:john) { Pirate.create(name: "John") }

    it "can create ship instances" do
      john.ships.build(name: "Titanic")
      john.ships.build(name: "Black Pearl")
      john.save
      expect(john.ships.count).to eq(2)
      expect(Ship.count).to eq(2)

      names = Ship.all.map { |e| e.name }
      expect(names).to include("Titanic" && "Black Pearl")
    end

  end

end