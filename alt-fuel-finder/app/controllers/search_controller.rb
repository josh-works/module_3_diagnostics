class SearchController < ApplicationController


  def index
    conn = NrelService.new
    @stations = conn.nearest_stations_by_zip(80203)[0..9]
  end
end
