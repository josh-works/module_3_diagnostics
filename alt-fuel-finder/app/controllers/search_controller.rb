class SearchController < ApplicationController


  def index
    conn = NrelService.new
    @stations = conn.nearest_stations_by_zip(params["q"])[0..9]
  end
end
