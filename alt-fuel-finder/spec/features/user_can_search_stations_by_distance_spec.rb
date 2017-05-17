require 'rails_helper'

RSpec.feature "As a user" do
  context "and I search a given zip code" do
    it "should place search params in URL" do
      zip_code = 80203

      get(root_path)
      fill_in("search by zip...").with(zip_code)
      click_on "Locate"
      expect(path).to contain(zip_code)
    end

    it "should return list of closest stations" do
      zip_code = 80203

      get(root_path)
      fill_in("search by zip...").with(zip_code)
      click_on "Locate"

      expect(path).to match("/search")
      expect(page).to have_css(".station_list")
      expect(Station.count).to eq(10)
    end

    it "results should be limited to electric and propane" do
    end

    it "each station should have name, address, fuel types, distance, and access times" do
    end
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
