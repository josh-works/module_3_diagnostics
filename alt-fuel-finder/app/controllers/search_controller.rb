class SearchController < ApplicationController


  def index
    conn = Faraday.new("https://developer.nrel.gov")
    raw = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=S9nWjdAxKadPGBVKfBnjdIRaemILUjbVKpY5M6Zi&location=80203&radius=6&fuel_type=ELEC,LPG")
    pretty = JSON.parse(raw.body, symbolize_names: true)
    @stations = pretty[:fuel_stations]
  end


  private
    def parse(body)
      binding.pry
      JSON.parse(body["fuel_stations"])
    end


end
