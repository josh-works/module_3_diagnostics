require 'rails_helper'

RSpec.feature "As a user" do
  context "and I search a given zip code" do
    it "should place search params in URL" do
      zip_code = 80203

      visit root_path
      fill_in "q", with: zip_code

      click_on "Locate"

      expect(page).to have_current_path(/\/search?/)
      expect(page).to have_current_path(/80203/)
    end

    it "should return list of closest stations" do
      zip_code = 80203

      visit root_path
      fill_in "q", with: zip_code
      click_on "Locate"

      expect(page).to have_css(".station_list")
      expect(page).to have_selector(".station_show", count: 10)
    end

    it "results should be limited to electric and propane" do
    end

    it "each station should have name, address, fuel types, distance, and access times" do
      zip_code = 80203

      visit root_path
      fill_in "q", with: zip_code
      click_on "Locate"

      expect(page).to have_css(".station_list")
      first(".station_show") do
        expect(text).to have_content("Station ID")
        expect(text).to have_content("Street address")
        expect(text).to have_content("Fuel types")
      end
    end
  end
end
