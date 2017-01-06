require 'rails_helper'

describe "As a user who clicks on a store" do
  it "I can see its information" do
    VCR.use_cassette("single_store") do
      visit "/stores/1171"

      expect(current_path).to eq("/stores/1171")
      expect(page).to have_content("BigBox")
      expect(page).to have_content("Centennial")
      expect(page).to have_content("303-797-3246")
    end
  end
end
