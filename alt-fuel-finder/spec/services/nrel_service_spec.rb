require 'rails_helper'

RSpec.describe NrelService do
  context "it calls NREL api" do
    it "returns list of stations filtered by zip code" do
      zip_code = 80203
      nrel = NrelService.new

      stations = nrel.nearest_stations_by_zip(zip_code)

      expect(stations.count).to be(20)
      expect(stations.first[:city]).to eq("Denver")
    end
  end

end
