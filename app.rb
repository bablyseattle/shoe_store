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
