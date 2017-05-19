class Station < OpenStruct
  attr_reader :service

  def self.service
    @service ||= NrelService.new
  end

  def self.nearest_stations_by_zip(zip_code, station_count = 10)
    service.nearest_stations_by_zip(zip_code).map do |station|
      Station.new(station)
    end
  end
end
