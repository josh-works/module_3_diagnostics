require 'rails_helper'

RSpec.describe Station, type: :model do
  context "#nearest_stations_by_zip" do
    it "should return station objects" do
      zip_code = 80203
      stations = Station.nearest_stations_by_zip(zip_code)
      station = stations.first
  
      expect(station).to be_kind_of(Struct::Station)
    end
  end
end
