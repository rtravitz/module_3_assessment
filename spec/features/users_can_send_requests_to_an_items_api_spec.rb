require 'rails_helper'

describe "As a user when I send a", :type => :request do
  context "GET request to /api/v1/items" do
    it "I receive a 200 json response containing all items" do
      item1 = Item.create(name: "item1", description: "desc1", image_url: "test.jpg")
      item2 = Item.create(name: "item2", description: "desc2", image_url: "test2.jpg")
      get "/api/v1/items"
      expect(response).to be_success
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json.first[:name]).to eq("item1")
      expect(json.last[:description]).to eq("desc2")
      expect(json.last[:image_url]).to eq("test2.jpg")
      expect(json.last[:created_at]).to eq(nil)
      expect(json.last[:updated_at]).to eq(nil)
    end
  end

  context "GET request to /api/v1/items/:id" do
    it "I receive a 200 json response containing the item" do
      item1 = Item.create(name: "item1", description: "desc1", image_url: "test.jpg")
      get "/api/v1/items/#{item1.id}"
      expect(response).to be_success
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:id]).to eq(item1.id)
      expect(json[:name]).to eq(item1.name)
    end
  end

  context "DELETE request to /api/v1/items/:id" do
    it "I receive a 204 json response if the record is deleted" do
    end
  end
end
