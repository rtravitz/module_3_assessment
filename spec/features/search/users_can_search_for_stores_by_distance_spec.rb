require 'rails_helper'

describe "As a user when I use the search box" do
  it "I can see stores within a specified distance" do
    VCR.use_cassette("store_distance") do
      visit "/"
      fill_in "zipcode", with: "80202"
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Stores")
      expect(page).to have_content("16 Total Stores")
      expect(page).to have_content("Centennial")
      expect(page).to have_content("BigBox")
      expect(page).to have_content("303-797-3246")
      expect(page).to have_content("15")
    end
  end
end
