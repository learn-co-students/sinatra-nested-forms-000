class CreateShips < ActiveRecord::Migration
  def change
  	create_table :ships do |t|
  	  t.string :name
  	  t.string :ship_type
  	  t.string :booty
  	  t.references :pirate
  	  t.timestamps null: false
  	end
  end
end