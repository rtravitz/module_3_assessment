require 'rails_helper'

describe "BestbuyService" do
  context "#stores_by_distance" do
    it "returns a hash of bestbuy stores by distance" do
      VCR.use_cassette("bestbuy_service_distance") do
        result = BestbuyService.new.stores_by_distance("80202")
        expect(result).to be_instance_of(Hash)
        expect(result[:total]).to eq(16)
        expect(result[:stores].first[:name]).to eq("Cherry Creek Shopping Center")
      end
    end
  end
end
