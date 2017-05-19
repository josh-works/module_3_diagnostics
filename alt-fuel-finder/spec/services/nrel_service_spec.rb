require 'rails_helper'

RSpec.describe NrelService do
  context "it calls NREL api" do
    it "#nearest_stations_by_zip" do
      zip_code = 80203
      results_count = 14
      nrel = NrelService.new
      stations = nrel.nearest_stations_by_zip(zip_code, results_count)
      expect(stations.count).to be(results_count)
      expect(stations.first[:city]).to eq("Denver")
    end
  end

end
