class Market < ActiveRecord::Migration
  def change
  	create_table :markets do |t|
      t.string :name
      t.string :address
      t.text :products
      t.string :schedule
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
