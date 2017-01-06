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

  context "methods" do
    it "generate stores returns an array of stores" do
      VCR.use_cassette("generate_stores") do
        result = Store.generate_stores("80202")

        expect(result).to be_instance_of(Array)
        expect(result.first).to be_instance_of(Store)
        expect(result.first.type).to eq("Mobile")
      end
    end

    it "total_stores returns the count of total stores for a zip" do
      VCR.use_cassette("total_stores") do
        result = Store.total_stores("80202")
        expect(result).to eq(16)
      end
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

