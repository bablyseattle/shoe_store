class CreateBrandsShoes < ActiveRecord::Migration[5.1]
  def change
  	create_table(:brands_shoes) do | bs|
  		bs.column(:store_id, :int)
  		bs.column(:brand_id, :int)
  	end
  end
end
