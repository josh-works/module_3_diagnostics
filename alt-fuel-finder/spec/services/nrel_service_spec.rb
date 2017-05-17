require 'rails_helper'

RSpec.describe NrelService do
  context "it calls NREL api" do
    it "#nearest_stations_by_zip" do
      zip_code = 80203
      nrel = NrelService.new
      stations = nrel.nearest_stations_by_zip(zip_code)

      expect(stations.count).to be(20)
      expect(stations.first[:city]).to eq("Denver")
    end

    it "#nearest_stations_by_zip returns station objects" do
      zip_code = 80203
      nrel = NrelService.new
      stations = nrel.nearest_stations_by_zip(zip_code)
      station = stations.first

      expect(station).to be_kind_of(Station)
    end

  end

end
