require "capybara/rspec"
require "./app"
require "pry"
require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a store' do
    visit '/'
    fill_in('Store Name', :with => 'Nordstroms')
    click_button('Add store')
    expect(page).to have_content('NORDSTROMS')
  end
end

describe 'the store update path', {:type => :feature} do
  it 'allows a user to change the name of the store' do
    test_store = Store.new({:name => 'shoe home', :id => nil})
    test_store.save
    visit '/'
    click_link('SHOE HOME')
    fill_in('name', :with => 'shoe house')
    click_button('Update')
    expect(page).to have_content('SHOE HOUSE')
  end
end

describe 'the store delete path', {:type => :feature} do
  it 'allows a user to delete a store' do
    test_store = Store.new({:name => 'foot kiss', :id => nil})
    test_store.save
    visit '/'
    click_link('FOOT KISS')
    click_button('Delete')
    visit '/'
    expect(page).not_to have_content("FOOT KISS")
  end
end

describe 'the brand creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a brand' do
    visit '/'
    fill_in('Brand Name', :with => 'Nike')
    fill_in('Price', :with => '30')
    click_button('Add brand')
    expect(page).to have_content('NIKE')
  end
end

describe 'the addition of brand to store', {:type => :feature} do
  it 'allows a user to add brand to store' do
    test_store = Store.new({:name => 'shoe home', :id => nil})
    test_store.save
    test_brand = Brand.new({:name => 'nike', :price => 50,  :id => nil})
    test_brand.save
	visit '/'
    click_link('SHOE HOME')
    expect(page).to have_content('NIKE')
  end
end