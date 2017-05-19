class SearchController < ApplicationController


  def index
    @stations = Station.nearest_stations_by_zip(params["q"])
  end
end
