require 'rails_helper'

describe "As a user when I send a" do
  context "GET request to /api/v1/items" do
    it "I receive a 200 json response containing all items" do
      item1 = Item.create(name: "item1", description: "desc1", image_url: "test.jpg")
      item2 = Item.create(name: "item2", description: "desc2", image_url: "test2.jpg")
      get "/api/v1/items"
      json = JSON.parse(response.body)

      expect(json.first[:name]).to eq("item1")
      expect(json.last[:description]).to eq("desc2")
    end
  end
end
