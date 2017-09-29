class Brand < ActiveRecord::Base
	has_and_belongs_to_many(:stores)
	
validates(:name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  	before_save(:capitalizes_name, {})

  	private

		  def capitalizes_name
		    name = self.name.split(" ")
		    self.name = name.map{ |word| word.upcase }.join(" ")
		end
end