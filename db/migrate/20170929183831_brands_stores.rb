class BrandsStores < ActiveRecord::Migration[5.1]
  def change
  	create_table(:brands_stores) do | bs|
  		bs.column(:store_id, :int)
  		bs.column(:brand_id, :int)
  		bs.timestamp
  	end
  end
end
