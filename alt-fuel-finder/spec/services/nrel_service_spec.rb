require 'rails_helper'

RSpec.describe NrelService do
  context "it calls NREL api" do
    it "returns list of stations filtere by zip code" do
      zip_code = 80203

      nrel = NrelService.new
      stations = nrel.find_stations_by_zip(zip_code)

      expect

    end
  end

end
