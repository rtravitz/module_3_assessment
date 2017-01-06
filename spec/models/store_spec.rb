require 'rails_helper'

describe "Store" do
  context "attributes" do
    it "has the correct attributes" do
      store = Store.new(mock_store)

      expect(store.name).to eq("Cherry Creek Shopping Center")
      expect(store.city).to eq("Denver")
      expect(store.distance).to eq(3.25)
      expect(store.type).to eq("Mobile")
      expect(store.phone).to eq("303-270-9189")
    end
  end
end

def mock_store
  {
    phone: "303-270-9189",
    city: "Denver",
    distance: 3.25,
    storeType: "Mobile",
    name: "Cherry Creek Shopping Center"
  }
end
