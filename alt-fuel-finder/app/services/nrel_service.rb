class NrelService < OpenStruct

  def initialize

    @conn = Faraday.new("https://developer.nrel.gov")
  end

  def nearest_stations_by_zip(zip)
    raw = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=S9nWjdAxKadPGBVKfBnjdIRaemILUjbVKpY5M6Zi&location=#{zip}&radius=6&fuel_type=ELEC,LPG")
    pretty = parse(raw)
    pretty[:fuel_stations]
  end

  private
  attr_reader :conn

  def parse(object)
    JSON.parse(object.body, symbolize_names: true)
  end
end
