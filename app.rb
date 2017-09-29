require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
	@list = Store.all
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
	@list = @store.brands
	erb :store
end

post('/add_brand') do
	name = params["brand_name"]
	price = params["price"]
	brand = Brand.new({:name => name, :price => price})
	brand.save
	redirect back
end