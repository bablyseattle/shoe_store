require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
	@list_store = Store.all
	@list_brand = Brand.all
	erb :index
end

post('/add_store') do
	name = params["store_name"]
	store = Store.new({:name => name})
	store.save
	redirect '/'
end

get('/store/:id') do
	@store = Store.find(params[:id])
	@brands = Brand.all
	@list = @store.brands
	erb :store
end

post('/add_brand') do
	name = params["brand_name"]
	price = params["price"]
	brand = Brand.new({:name => name, :price => price})
	brand.save
	redirect ('/')
end
post('/add_brand_to_store') do
	brands = []
	brand_ids = params['check']
	@store = Store.find(params["store_id"])
	brand_ids.each do |id|
		brands.push(Brand.find (id.to_i))
	end
	brands.each do |brand|
		@store.brands.push(brand)
	end
	redirect "/store/#{@store.id}"
end

delete('/delete_store/:id') do
	store = Store.find(params[:id])
	store.destroy
	redirect '/'
end

patch('/update_store/:id') do
	@store = Store.find(params[:id])
	@store.name = params["name"]
	@store.save
	redirect "/store/#{@store.id}"
end
