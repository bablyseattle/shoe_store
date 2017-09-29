class CreateBrands < ActiveRecord::Migration[5.1]
  def change
  	create_table(:brands) do |b|
  		b.column(:name, :varchar)
  		b.column(:price, :int)
  	end
  end
end
