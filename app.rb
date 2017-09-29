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