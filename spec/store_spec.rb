require 'spec_helper'

describe(Store) do
  it("doesn't save if name is left blank") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  it 'validates presence of name' do
      store = Store.new({name: "Shoe house"})
      expect(store.save).to eq true
  end

  it("ensures the length of title is at most 100 characters") do
    store = Store.new({:name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

  it 'validates uniqueness of name' do
    store = Store.new({name: "Sue"})
    store.save
    store2 = Store.new({name: "Sue"})
    expect(store2.save).to eq false
  end

  it("converts  store name to uppercase") do
    store = Store.new({:name => "shoe shine"})
    store.save
    expect(store.name()).to(eq("SHOE SHINE"))
  end

end