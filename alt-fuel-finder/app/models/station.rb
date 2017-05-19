class Station
  attr_reader :service
  Station = Struct.new("Station",
                      :id,
                      :fuel_type_code,
                      :station_phone,
                      :city,
                      :intersection_directions,
                      :street_address,
                      :fuel_type_code,
                      :access_days_time,
                      :distance
                      )

  def self.service
    @service ||= NrelService.new
  end

  def self.nearest_stations_by_zip(zip_code, station_count = 10)
    service.nearest_stations_by_zip(zip_code).map do |station|
      Station.new(
                  station[:id],
                  station[:fuel_type_code],
                  station[:station_phone],
                  station[:city],
                  station[:intersection_directions],
                  station[:street_address],
                  station[:fuel_type_code],
                  station[:access_days_time],
                  station[:distance]
                  )
    end
  end
end
