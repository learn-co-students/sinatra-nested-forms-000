class CreatePirates < ActiveRecord::Migration
  def change
  	create_table :pirates do |t|
  	  t.string :name
  	  t.string :weight
  	  t.string :height
  	  t.timestamps null: false
  	end
  end
end