class DropBrandsShoesTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :brands_shoes
  end
end
